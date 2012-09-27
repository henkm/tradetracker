jQuery ->
  getExample()
  $(document).bind "page:change", ->
    getExample()

self.getExample = ->
  $('#get-example').click ->
    $.get('/productfeed/exmple?url=' + encodeURIComponent($('#productfeed_xml_url').val()))

  $('.product_content').click ->
    $('.product_content').height('105px')
    if $(this).height() == "100"
      alert('ok')
    else
      $(this).animate
        height: '100%'
  