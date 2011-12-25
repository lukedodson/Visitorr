/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	
  /* Filebrowser routes */
	
  config.filebrowserUploadUrl = null;

  // The location of an external file browser, that should be launched when "Browse Server" button is pressed.
  config.filebrowserBrowseUrl = false;

  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Flash dialog.
  config.filebrowserFlashBrowseUrl = false;

  // The location of a script that handles file uploads in the Flash dialog.
  config.filebrowserFlashUploadUrl = false;
  
  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Link tab of Image dialog.
  config.filebrowserImageBrowseLinkUrl = false;

  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Image dialog.
  config.filebrowserImageBrowseUrl = false;

  // The location of a script that handles file uploads in the Image dialog.
  config.filebrowserImageUploadUrl = false;
  
  // The location of a script that handles file uploads.
  config.filebrowserUploadUrl = false;
  
  // Rails CSRF token
  config.filebrowserParams = function(){
    var csrf_token = jQuery('meta[name=csrf-token]').attr('content'),
        csrf_param = jQuery('meta[name=csrf-param]').attr('content'),
        params = new Object();
    
    if (csrf_param !== undefined && csrf_token !== undefined) {
      params[csrf_param] = csrf_token;
    }
    
    return params;
  };
  
  /* Extra plugins */
  // works only with en, ru, uk locales
  config.extraPlugins = "embed,attachment";
  
  /* Toolbars */
  config.toolbar = 'Easy';
  
  config.toolbar_Easy =
    [
        ['Source','-','Preview'],
        ['Cut','Copy','Paste','PasteText','PasteFromWord',],
        ['Undo','Redo','-','SelectAll','RemoveFormat'],
        ['Styles','Format'], ['Subscript', 'Superscript', 'TextColor'], ['Maximize','-','About'], '/',
        ['Bold','Italic','Underline','Strike'], ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['Link','Unlink','Anchor'], ['Image', 'Attachment', 'Flash', 'Embed'],
        ['Table','HorizontalRule','Smiley','SpecialChar','PageBreak']
    ];
    
    config.toolbar = 'Maybe';
    
    config.toolbar_Maybe = 
    [
      [ 'Source' ],
      [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] ,
      [ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] ,
      [ 'Link','Unlink','Anchor', 'Image' ],
      '/',
      [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ],
      [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
      '/',
      [ 'Styles','Format','Font','FontSize' ],
      [ 'TextColor','BGColor' ]
    ]
};
