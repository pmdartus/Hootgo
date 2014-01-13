/*global $:false */
/*global Mustache:false */

var ready;
ready = function() {
    var mode = null;

    var userPages = window.userPages;
    var providedLanguages = window.providedLanguages;

    var pageTemplate = $('#page-template').html();

    var _init = function() {
        for (var i = 0; i < userPages.length; i++) {
            for (var j = 0; j < providedLanguages.length; j++) {
                if(userPages[i].language_id === providedLanguages[j].id) {
                    userPages[i].language = providedLanguages[j];
                }
            }

            var pageRendered = Mustache.render(pageTemplate, userPages[i]);
            $('#conserned-pages').prepend(pageRendered);
        }
    };

    var changeMode = function(selectedMode) {
        mode = selectedMode;
        var invertMode = mode === 'asap' ? 'sched' : 'asap';

        $('#send-'+mode).addClass('btn-primary');
        $('#send-'+invertMode).removeClass('btn-primary');

        $('#send-'+mode).removeClass('btn-default');
        $('#send-'+invertMode).addClass('btn-default');

        $('#camapaign-form').removeClass('hidden');
    };

    var deletePage = function(elt) {
        var pageName = null;
        var pageId = elt.closest('.page').data('id');

        for (var i = 0; i < userPages.length; i++) {
            pageName = userPages[i].id === pageId ? userPages[i].name : null;
        }

        var dropdownElt = '<li><a data-id="'+ pageId +'">'+ pageName +'</li>';
        $('#add-page .dropdown-menu').append(dropdownElt);
        $('#add-page').removeClass('hidden');

        elt.closest('.page').remove();
    };

    $('#send-asap').click(function() {
        changeMode('asap');
    });

    $('#send-sched').click(function() {
        changeMode('sched');
    });

    $('#camapaign-form').on('click', '.remove', function() {
        deletePage($(this));
    });

    _init();
};

$(document).ready(ready);
$(document).on('page:load', ready);