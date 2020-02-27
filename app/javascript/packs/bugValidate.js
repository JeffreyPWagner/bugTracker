console.log

let submitButton = document.getElementById("submit-button");
submitButton.disabled = true;
let titleInput = document.getElementsByName('bug[title]')[0];
let descInput = document.getElementsByName('bug[description]')[0];
let titleErrorMessage = document.getElementById('titleErrorMessage'); 
let descErrorMessage = document.getElementById('descErrorMessage');

titleInput.addEventListener('input', (event) => {
  titleErrorMessage.textContent = '';
  let titleText = document.getElementsByName('bug[title]')[0].value;
  let descText = document.getElementsByName('bug[description]')[0].value;
  console.log('titleText: ' + titleText);
  if (titleText.length < 1) {
    console.log("Error: Title cannot be blank");
    titleErrorMessage.innerHTML = "Title cannot be blank";
    document.getElementById("submit-button").disabled = true;
  } else if (descText.length > 0) {
    document.getElementById("submit-button").disabled = false;
  }
});

descInput.addEventListener('input', (event) => {
  descErrorMessage.textContent = '';
  let titleText = document.getElementsByName('bug[title]')[0].value;
  let descText = document.getElementsByName('bug[description]')[0].value;
  console.log('descText: ' + descText);
  if (descText.length < 1) {
    console.log("Error: Desc cannot be blank");
    descErrorMessage.innerHTML = "Description cannot be blank";
    document.getElementById("submit-button").disabled = true;
  } else if (titleText.length > 0) {
    document.getElementById("submit-button").disabled = false;
  }
});

//disable submit button when title is blank and add submit listener back in in case they never touch title, then format error