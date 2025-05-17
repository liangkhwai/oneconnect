import path from "path";
import react from "@vitejs/plugin-react";
import { defineConfig } from "vite";

export default defineConfig({
  plugins: [react()],

  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },
  preview: {
    port: process.env.PORT,
    strictPort: true,
  },
  server: {
    port: process.env.PORT,
    strictPort: true,
    host: true,
    origin: "http://0.0.0.0:" + process.env.PORT,
  },
});
