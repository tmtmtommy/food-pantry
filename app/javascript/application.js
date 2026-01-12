// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

const setupStockModeToggle = () => {
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

  // Turbo遷移で複数回呼ばれるので、二重登録を防ぐ
  modeMaster.removeEventListener("change", render);
  modeCustom.removeEventListener("change", render);

  modeMaster.addEventListener("change", render);
  modeCustom.addEventListener("change", render);
  render();
};

// ❌ DOMContentLoaded はTurbo遷移で発火しないことがある
// document.addEventListener("DOMContentLoaded", setupStockModeToggle);

// ⭕ Turbo対応
document.addEventListener("turbo:load", setupStockModeToggle);
// 戻る/進む等のキャッシュ復元でも安定させたいならこれも
document.addEventListener("turbo:render", setupStockModeToggle);
