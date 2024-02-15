const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
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
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
