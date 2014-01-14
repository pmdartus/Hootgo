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

    var updateTweetLength = function(text) {
        var remainingLetters = 140;
        var escapeLetters = ['[', ']'];
        text = text.trim();
        for (var i = 0; i < text.length; i++) {
            if (escapeLetters.indexOf(text[i]) === -1) {
                remainingLetters--;
            }
        }
        console.log(remainingLetters);
    };

    var deletePage = function(elt) {
        var pageName = null;
        var pageId = elt.closest('.page').data('id');

        for (var i = 0; i < userPages.length; i++) {
            if (userPages[i].id === parseInt(pageId)) {
                pageName =  userPages[i].name;
            }
        }

        var dropdownElt = '<li><a data-id="'+ pageId +'">'+ pageName +'</li>';
        $('#add-page .dropdown-menu').append(dropdownElt);
        $('#add-page').removeClass('hidden');

        elt.closest('.page').addClass('hidden');
    };

    var addPage = function(elt) {
        var pageId = elt.data('id');
        elt.remove();

        if ($('#add-page .dropdown-menu a').length === 0) {
            $('#add-page').addClass('hidden');
        }

        $('.page[data-id="' + pageId + '"]').removeClass('hidden');
    };

    var submitCampaign = function() {
        $.ajax({
          type: 'POST',
          url: '/campaigns',
          data: {campaign: {text: 'coucou tu veux voir'}},
          success: function(data) {
            console.log(data);
          },
          dataType: 'json'
        });
    };

    $('#send-asap').click(function() {
        changeMode('asap');
    });

    $('#send-sched').click(function() {
        changeMode('sched');
    });

    $('#camapaign-form textarea').keyup(function() {
        updateTweetLength($(this).val());
    });

    $('#camapaign-form').on('click', '.remove', function() {
        deletePage($(this));
    });

    $('#add-page .dropdown-menu').on('click', 'a', function() {
        addPage($(this));
    });

    $('#campaign-submit').click(function() {
        submitCampaign();
    });

    _init();
};

$(document).ready(ready);
$(document).on('page:load', ready);