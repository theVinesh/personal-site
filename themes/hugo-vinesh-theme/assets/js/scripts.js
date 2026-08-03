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

function addResumePrintButtonHandler() {
  var printButtons = document.querySelectorAll('[data-print-resume]');

  if (printButtons.length === 0 || typeof window.print !== 'function') {
    return;
  }

  for (var i = 0; i < printButtons.length; i++) {
    printButtons[i].addEventListener('click', function() {
      window.print();
    });
  }
}

addResumePrintButtonHandler();

function initRoleRotator() {
  var rotator = document.getElementById('role-rotator');
  var articleEl = document.getElementById('role-article');

  if (!rotator) return;

  var roles = [
    { word: 'Builder', article: 'a' },
    { word: 'Dad', article: 'a' },
    { word: 'Home Cook', article: 'a' },
    { word: 'Tinkerer', article: 'a' },
    { word: 'Engineer', article: 'an' },
    { word: 'Learner', article: 'a' }
  ];

  var currentIndex = 0;
  var intervalTime = 3000;

  setInterval(function() {
    if (document.hidden) return;

    var currentWordEl = rotator.querySelector('.role-word:not(.is-exiting)');
    if (!currentWordEl) return;

    var nextIndex = (currentIndex + 1) % roles.length;
    var currentRole = roles[currentIndex];
    var nextRole = roles[nextIndex];

    var startWidth = rotator.offsetWidth;
    rotator.style.width = startWidth + 'px';

    currentWordEl.classList.add('is-exiting');

    var nextWordEl = document.createElement('strong');
    nextWordEl.className = 'role-word is-entering';
    nextWordEl.textContent = nextRole.word;
    rotator.appendChild(nextWordEl);

    var targetWidth = nextWordEl.offsetWidth;
    rotator.style.width = targetWidth + 'px';

    if (articleEl && currentRole.article !== nextRole.article) {
      articleEl.style.opacity = '0';
      setTimeout(function() {
        articleEl.textContent = nextRole.article;
        articleEl.style.opacity = '1';
      }, 150);
    }

    requestAnimationFrame(function() {
      requestAnimationFrame(function() {
        nextWordEl.classList.remove('is-entering');
      });
    });

    setTimeout(function() {
      if (currentWordEl && currentWordEl.parentNode) {
        currentWordEl.parentNode.removeChild(currentWordEl);
      }
      rotator.style.width = '';
    }, 450);

    currentIndex = nextIndex;
  }, intervalTime);
}

initRoleRotator();
