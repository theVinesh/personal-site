export class Analytics{
      init() {
        window.ga = window.ga || ((...args) => (ga.q = ga.q || []).push(args));
        ga('create', 'UA-142502015-1', 'auto');
        ga('set', 'transport', 'beacon');
        ga('send', 'pageview');
     }
}
