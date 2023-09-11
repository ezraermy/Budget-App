/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [],
  theme: {
    extend: {},
  },
  plugins: [],

  purge: {
    enabled: process.env.NODE_ENV === 'production',
    content: [
      './app/**/*.html.erb',
      './app/helpers/**/*.rb',
      './app/javascript/**/*.js',
    ],
  },
}

