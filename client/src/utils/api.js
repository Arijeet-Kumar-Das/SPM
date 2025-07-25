import axios from "axios";

const API = axios.create({
  baseURL: "https://spm-f7xy.onrender.com/api", // Your backend URL
});

// Add JWT token to every request if available
API.interceptors.request.use((config) => {
  const token = localStorage.getItem("token");
  if (token) {
    config.headers.Authorization = `Bearer ${token}`;
  }
  return config;
});

export default API;
