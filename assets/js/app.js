import "../css/app.scss";

import "phoenix_html";
import {Socket} from "phoenix";
import NProgress from "nprogress";
import {LiveSocket} from "phoenix_live_view";
import "./components/ui.js";

let csrfToken = document
  .querySelector("meta[name='csrf-token']")
  .getAttribute("content");
let liveSocket = new LiveSocket("/live", Socket, {
  params: {_csrf_token: csrfToken},
});

window.addEventListener("phx:page-loading-start", (_) => NProgress.start());
window.addEventListener("phx:page-loading-stop", (_) => NProgress.done());

liveSocket.connect();

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket;
