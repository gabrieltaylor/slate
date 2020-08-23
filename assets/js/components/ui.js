let closeAlert = (event) => {
  let element = event.target;
  element.closest("[role='alert']").remove();
};

window.closeAlert = closeAlert;
