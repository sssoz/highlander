# Highlander Theme

A custom theme for the [Highland Institute](https://highlandinstitute.org/)’s open access journal, [The Highlander Journal](https://journals.highlandinstitute.org/) compatible with [OJS 3.1.1+](https://pkp.sfu.ca/ojs/). 

The Highland Institute is an Independent Research Center working on historical, socio-cultural, environmental, and development topics related to highland Asia. The Highlander Journal is an academic, open-access, and peer-reviewed online journal, originally founded in 2015 at the University of Edinburgh. 

### Contribute & install theme

To contribute changes you will need to install this theme from the `master` branch of this repository.

1. `git clone https://github.com/pkp/highlander.git`.
2. Move to the theme’s root folder: `cd highlander`.
3. Make sure that [npm](https://www.npmjs.com/get-npm) and [Gulp](https://gulpjs.com/) are installed.
4. Resolve dependencies: `npm install`. Gulp config file is inside a theme root folder `gulpfile.js`.
5. To compile external SCSS, concatenate styles and minify: `gulp sass`. The result CSS path is `resources/dist/app.min.css`. The theme’s own styles are compiled automatically by OJS’s theme API.
6. To concatenate and minify javascript: `gulp scripts` and `gulp compress`. The result Javascript file path is `resources/dist/app.min.js`. Run `gulp watch` to view javascript changes inside `resources/js` folder in real time.
7. To compile and minify all at once: `gulp compileAll`.
8. Copy the plugin’s folder to `plugins/themes` directory starting from the OJS installation root folder.
9. Login into the OJS admin dashboard, activate the plugin and enable the theme.

Note that the master branch may contain code that will not be shipped to the stable release.

## Contributors

The Highlander theme was customised by Sophy O ([@sssoz](https://github.com/sssoz)) using her own designed theme for [PKP](https://github.com/pkp)’s out-of-the-box [Immersion theme](https://github.com/pkp/immersion).

## Settings

**Homepage image.** This theme allows the personalisation of the header background image. By default no image is present but it is strongly recommend to use one for the best visual experience. It can be downloaded through Settings &rarr; Website &rarr; Homepage Image.

**Sections’ background colour.** Highlander theme adds an option for changing background colour of issue sections. It is available under issue menu (for each issue). Picked colours will be displayed prominently on the journal landing page and issue page. The default background colour for all sections is white and can be set differently for each section.

**Section description.** If Browse By Section plugin is activated and configured, the theme allows to display a description for each section on the index journal and issue page which is added through the section form.

**Announcement Section Background colour.** Announcements can be displayed prominently on journal’s home page. It can be set in Settings &rarr; Website &rarr Announcements. Highlander theme adds an option to change the background colour for announcements section enabled through this menu.

**Galleys.** If there isn’t any CSS file attached to the HTML galley, the default theme’s style will be used.

## License

This theme is released under the GPL license.

The Roboto font is distributed under the terms of the [Apache License, 2.0](http://www.apache.org/licenses/LICENSE-2.0). The Spectral font is distributed under the terms of the [Open Font License](https://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL).


