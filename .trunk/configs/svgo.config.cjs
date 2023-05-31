module.exports = {
  js2svg: {
    pretty: true,
  },
  plugins: [
    {
      name: "preset-default",
      params: {
        overrides: {
          removeViewBox: false, // https://github.com/svg/svgo/issues/1128
          sortAttrs: true,
          removeOffCanvasPaths: true,
          finalNewline: true,
        },
      },
    },
  ],
};
