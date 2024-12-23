// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"import "controllers"

// Rediriger les logs vers une div visible
if (window.location.hostname.includes('ngrok')) {
  const debugDiv = document.createElement('div');
  debugDiv.style.cssText = 'position:fixed;bottom:0;left:0;right:0;background:rgba(0,0,0,0.8);color:white;padding:10px;font-family:monospace;z-index:9999;max-height:30vh;overflow-y:auto;';
  document.body.appendChild(debugDiv);

  const originalConsole = { ...console };
  ['log', 'error', 'warn'].forEach(method => {
    console[method] = (...args) => {
      originalConsole[method](...args);
      debugDiv.innerHTML += `<div>${args.join(' ')}</div>`;
    };
  });
}
