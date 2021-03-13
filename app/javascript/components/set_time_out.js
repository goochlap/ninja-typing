// set time out for notice messages
export function setTimeOut(){
  const flashDurationInSeconds = 4;
  const flashContainerId = 'flash-message';

  function removeFlashMessages() {
    $('#' + flashContainerId).remove();
  }

  setTimeout(removeFlashMessages, flashDurationInSeconds * 1000);
}
