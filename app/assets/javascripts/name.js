$(function() {
  $('.js-select').css('width', '200px');

  $('.js-select').each(function() {
    var url = $(this).data('url');
    console.log(url);
    
    $(this).select2({
      ajax: {
        url: url,
        dataType: 'json',
        delay: 250,
        data: function (params) {
        	console.log(params);
          return {
            q: params.term, // search term
            page: params.page
          };
        },
        processResults: function (data, page) {
          // parse the results into the format expected by Select2.
          // since we are using custom formatting functions we do not need to
          // alter the remote JSON data
          console.log(data);
          return {
            results: data
          };
        },
        cache: true
      },
      escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
      minimumInputLength: 1,
      templateResult: function(item) {
        console.log(item);
        return item;
      }
      //templateResult: formatRepo, // omitted for brevity, see the source of this page
      //templateSelection: formatRepoSelection // omitted for brevity, see the source of this page
    });
  });
});
