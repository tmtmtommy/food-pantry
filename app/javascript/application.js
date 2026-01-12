// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

document.addEventListener("DOMContentLoaded", () => {
  const modeMaster = document.getElementById("mode_master");
  const modeCustom = document.getElementById("mode_custom");
  const masterFields = document.getElementById("master_fields");
  const customFields = document.getElementById("custom_fields");

  if (!modeMaster || !modeCustom || !masterFields || !customFields) return;

  const render = () => {
    if (modeCustom.checked) {
      masterFields.classList.add("d-none");
      customFields.classList.remove("d-none");
    } else {
      customFields.classList.add("d-none");
      masterFields.classList.remove("d-none");
    }
  };

  modeMaster.addEventListener("change", render);
  modeCustom.addEventListener("change", render);
  render();
});
