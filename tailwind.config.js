const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        'primary': '#0c0c0c',
        'secondary': '#8e8f8f',
        'tertiary': '#6d6c6c',
        'quaternary': '#ebebeb',
        'quinary': '#a0aec0',
        'senary': '#cbd5e0',
        'septenary': '#e2e8f0',
        'octonary': '#edf2f7',
        'nonary': '#f7fafc',
        'denary': '#ffffff',
      },
      spacing: {
        '25': '6.25rem',
        '30': '7.5rem',
        '72': '18rem',
        '80': '20rem',
        '96': '24rem',
      },
    },
  },
}
