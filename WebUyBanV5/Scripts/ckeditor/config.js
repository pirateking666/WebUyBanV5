/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function (config) {
    // Define changes to default configuration here. For example:
    // config.language = 'fr';
    // config.uiColor = '#AADC6E';
    config.syntaxhighlight_lang = 'csharp';
    config.syntaxhighlight_hideControls = true;
    config.languages = 'vi';
    config.filebrowserBrowseUrl = '/Scripts/ckfinder/ckfinder.html';
    config.filebrowserImageBrowseUrl = '/Scripts/ckfinder/ckfinder.html?Type=Images';
    config.filebrowserFlashBrowseUrl = '/Scripts/ckfinder/ckfinder.html?Type=Flash';
    config.filebrowserUploadUrl = '/Scripts/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=File';
    config.filebrowserImageUploadUrl = '/Upload/';
    config.filebrowserUploadUrl = '/Scripts/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash';

    CKFinder.setupCKEditor(null, '/Scripts/ckfinder/');
};
