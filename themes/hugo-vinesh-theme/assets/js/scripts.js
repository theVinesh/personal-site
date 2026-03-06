var body = document.querySelector('body');
var menuTrigger = document.querySelector('#toggle-menu-main-mobile');
var menuContainer = document.querySelector('#menu-main-mobile');
var hamburgerIcon = document.querySelector('.hamburger');

if (menuTrigger !== null) {
  menuTrigger.addEventListener('click', function(e) {
    menuContainer.classList.toggle('open');
    hamburgerIcon.classList.toggle('is-active');
    body.classList.toggle('lock-scroll');
  });
}

function copyTextToClipboard(text) {
  if (navigator.clipboard && window.isSecureContext) {
    return navigator.clipboard.writeText(text);
  }

  return new Promise(function(resolve, reject) {
    var textArea = document.createElement('textarea');
    textArea.value = text;
    textArea.setAttribute('readonly', '');
    textArea.style.position = 'fixed';
    textArea.style.top = '0';
    textArea.style.left = '0';
    textArea.style.opacity = '0';

    body.appendChild(textArea);
    textArea.focus();
    textArea.select();
    textArea.setSelectionRange(0, textArea.value.length);

    try {
      if (document.execCommand('copy')) {
        resolve();
      } else {
        reject(new Error('Copy command was unsuccessful.'));
      }
    } catch (error) {
      reject(error);
    } finally {
      body.removeChild(textArea);
    }
  });
}

function getCodeText(highlightBlock) {
  var codeElement = highlightBlock.querySelector('pre code');

  if (codeElement === null) {
    return '';
  }

  var codeClone = codeElement.cloneNode(true);
  var lineNumberNodes = codeClone.querySelectorAll('.ln, .lnt');

  for (var i = 0; i < lineNumberNodes.length; i++) {
    lineNumberNodes[i].parentNode.removeChild(lineNumberNodes[i]);
  }

  return codeClone.textContent;
}

function setCopyButtonState(button, state) {
  var states = {
    idle: {
      label: 'Copy',
      announcement: 'Copy code to clipboard'
    },
    copied: {
      label: 'Copied',
      announcement: 'Code copied to clipboard'
    },
    error: {
      label: 'Error',
      announcement: 'Unable to copy code'
    }
  };
  var nextState = states[state] || states.idle;

  if (button.resetTimerId) {
    window.clearTimeout(button.resetTimerId);
    button.resetTimerId = null;
  }

  button.dataset.copyState = state;
  button.textContent = nextState.label;
  button.setAttribute('aria-label', nextState.announcement);
  button.setAttribute('title', nextState.label);
}

function resetCopyButton(button) {
  button.resetTimerId = window.setTimeout(function() {
    setCopyButtonState(button, 'idle');
  }, 2000);
}

function addCopyButtonsToCodeBlocks() {
  var highlightBlocks = document.querySelectorAll('.content .highlight');

  for (var i = 0; i < highlightBlocks.length; i++) {
    var highlightBlock = highlightBlocks[i];

    if (highlightBlock.querySelector('.code-copy-button') !== null) {
      continue;
    }

    var codeText = getCodeText(highlightBlock);

    if (codeText === '') {
      continue;
    }

    var copyButton = document.createElement('button');
    copyButton.type = 'button';
    copyButton.className = 'code-copy-button';
    copyButton.setAttribute('aria-live', 'polite');
    copyButton.setAttribute('aria-atomic', 'true');
    setCopyButtonState(copyButton, 'idle');

    copyButton.addEventListener('click', function() {
      var button = this;
      var text = getCodeText(button.parentNode);

      copyTextToClipboard(text)
        .then(function() {
          setCopyButtonState(button, 'copied');
          resetCopyButton(button);
        })
        .catch(function() {
          setCopyButtonState(button, 'error');
          resetCopyButton(button);
        });
    });

    highlightBlock.classList.add('highlight-copy-enabled');
    highlightBlock.insertBefore(copyButton, highlightBlock.firstChild);
  }
}

addCopyButtonsToCodeBlocks();
