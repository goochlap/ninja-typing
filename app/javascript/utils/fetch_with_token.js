import { csrfToken } from "@rails/ujs";

const fetchWithToken = (url, options) => {
  options.headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
    "X-CSRF-Token": csrfToken(),
  };
  options.credentials = "same-origin";
  
  return fetch(url, options);
}

export { fetchWithToken };