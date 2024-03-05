<script type="text/javascript">
  "use strict";;
  (function($, window, document) {
    // hide the ajax functional buttons untill the page load completely
    $("[data-link]").hide();
    $(".modalAction").hide();

    $(document).ready(function() {

      // Show featured-categories when page loaded
      $('.featured-categories.owl-loaded').removeClass('hide');

      // show the ajax functional buttons when the page loaded completely
      $("[data-link]").show();
      $(".modalAction").show();

      $.ajaxSetup({
        cache: false,
        headers: {
          'X-CSRF-TOKEN': "{{ csrf_token() }}"
        }
      });

      initAppPlugins();

      // Update the hash into the url when click a tab
      $('.nav a').on('show.bs.tab', function(e) {
        let offset = $(this).offset().top; // Get the offset of the element from the top

        window.location = $(this).attr('href'); // Update the hash into the url

        $(this).offset().top = offset; // Set the offset of the element from the top
      });

      // Toggle the overlay when menu open
      $('.menu-dropdown-list').on('mouseenter', function() {
        $('.overlay').addClass('active');
      }).on('mouseleave', function() {
        $('.overlay').removeClass('active');
      });

      $('#autoSearchInput').on('focus', function() {
        $('.overlay').addClass('active');
      }).on('focusout', function() {
        $('.overlay').removeClass('active');
      });

      $('.zoomPad').on('mouseenter', function() {
        $('.overlay').addClass('active');
      }).on('mouseleave', function() {
        $('.overlay').removeClass('active');
      });

      // Activate the tab if the url has any #hash
      $(function() {
        var hash = window.location.hash;
        hash && $('ul.nav a[href="' + hash + '"]').tab('show');
      });

      // Confirmation for actions
      $('body').on('click', '.confirm', function(e) {
        e.preventDefault();

        var form = this.closest("form");
        var url = $(this).attr("href");

        var msg = $(this).data('confirm');

        if (!msg) {
          msg = "{{ trans('theme.notify.are_you_sure') }}";
        }

        $.confirm({
          title: "{{ trans('theme.confirmation') }}",
          content: msg,
          type: 'red',
          icon: 'fas fa-question-circle',
          class: 'flat',
          animation: 'scale',
          closeAnimation: 'scale',
          opacity: 0.5,
          buttons: {
            'confirm': {
              text: '{{ trans('theme.button.proceed') }}',
              keys: ['enter'],
              btnClass: 'btn-primary flat',
              action: function() {
                //Disable mouse pointer events and set wait cursor
                // $('body').css("pointer-events", "none");
                $('body').css("cursor", "wait");

                if (typeof url != 'undefined') {
                  location.href = url;
                } else if (form != null) {
                  form.submit();
                  @include('theme::layouts.notification', ['message' => trans('theme.notify.confirmed'), 'type' => 'success', 'icon' => 'check-circle'])
                }

                return true;
              }
            },
            'cancel': {
              text: '{{ trans('theme.button.cancel') }}',
              btnClass: 'btn-default flat',
              action: function() {
                @include('theme::layouts.notification', ['message' => trans('theme.notify.canceled'), 'type' => 'warning', 'icon' => 'times-circle'])
              }
            },
          }
        });
      });

      // Dynamic content show/hide
      $('.show-hide-content-btn').on('click', function(e) {
        var el = $(this).siblings('.show-hide-content');

        if (el.hasClass('less')) {
          el.removeClass('less');
          $(this).html('{{ trans('theme.show_less') }} <i class="fa fa-angle-up"></i>');
        } else {
          el.addClass('less');
          $(this).html('{{ trans('theme.show_more') }} <i class="fa fa-angle-down"></i>');
        }
      });

      // Item Quick View Modal
      $(".itemQuickView").on("click", function(e) {
        e.preventDefault();
        var url = $(this).attr('data-link');

        // Disable the modal on small screen
        var width = $(window).width();
        if (width < 830) {
          window.location.href = url.replace("/quickView", "");
          return false;
        }

        apply_busy_filter('body');

        $.get(url, function(data) {
          remove_busy_filter('body');

          $('#quickViewModal').html(data).modal();

          //Initialize application plugins after ajax load the content
          if (typeof initAppPlugins == 'function') {
            initAppPlugins();
          }
        });
      });

      // Dynamic MODAL
      $(".modalAction").on("click", function(e) {
        e.preventDefault();
        apply_busy_filter('body');

        var url = $(this).attr('href');
        $.get(url, function(data) {
          remove_busy_filter('body');
          $('#myDynamicModal').html(data).modal();

          //Initialize application plugins after ajax load the content
          if (typeof initAppPlugins == 'function') {
            initAppPlugins();
          }
        });
      });

      // Language changes
      var langRoute = '{{ route('locale.change', '_lang_') }}';
      $('select#languageChange').ddslick({
        width: "115px",
        imagePosition: "left",
        selectText: "{{ trans('theme::lang.language_options') }}",
        onSelected: function(data) {
          var lang = data.selectedData.value;
          if (lang != '{{ \App::getLocale() }}') {
            window.location.href = langRoute.replace("_lang_", lang);
          }
        }
      });

      @if (is_incevio_package_loaded('dynamic-currency'))
        @include('dynamic-currency::scripts');
      @endif

      // Currency changes Mobile
      $("#mobile-curency").ddslick({
        width: "100%",
        imagePosition: "left",
        selectText: "Mobile Currency",
        onSelected: function(data) {
          $("#selected").html(data.selectedData.value);
        }
      });

      // Language changes mobile
      $("select#mobile-lang").ddslick({
        width: "100%",
        imagePosition: "left",
        selectText: "{{ trans('theme::lang.language_options') }}",
        onSelected: function(data) {
          var lang = data.selectedData.value;
          if (lang != '{{ \App::getLocale() }}') {
            window.location.href = langRoute.replace("_lang_", lang);
          }
        }
      });

      // Mobile mega menu
      $('.main-menu').mobileMegaMenu({
        changeToggleText: false,
        enableWidgetRegion: true,
        prependCloseButton: true,
        stayOnActive: true,
        // toogleTextOnClose: 'Close Menu',
        menuToggle: 'main-menu-toggle'
      });

      // Remmove the unwanted li that pushed via mobileMegaMenu plugin
      $("#mobile-lang ul li a.close-button").closest('li').remove();
    });

    // Search box without kyeword submission off
    $("#search-categories-form").on('submit', function(e) {
      var qeary = $('input#autoSearchInput').val();

      if (qeary.length > 2) {
        $('#search-nav-feedabck').addClass('hide');
        this.submit();
      } else {
        $('#search-nav-feedabck').removeClass('hide');
        e.preventDefault();
      }

      return;
    });

    // Product compare function
    $(function() {
      $('#compare-criteria').on("change", function() {
        var section = $(this).find("option:selected").val().toLowerCase();

        if (section == "all") {
          $('tbody[data-filter="target"]').css("display", "table-row-group")
        } else {
          $('tbody[data-filter="target"]').css("display", "none");
          $("#" + section).css("display", "table-row-group");
        }

        $(this).css("display", "block");
      });
    })

    //App plugins
    function initAppPlugins() {
      //Initialize validator
      $('#form, form[data-toggle="validator"]').validator({
        disable: false,
      });

      $('.sc-add-to-cart').removeAttr('href').css('cursor', 'pointer').show();

      // Add-to-cart
      $(".sc-add-to-cart").off().on("click", function(e) {
        e.preventDefault();

        if ($(this).attr('disabled')) {
          return false;
        }

        var item = $(this).closest('.sc-product-item');
        var qtt = item.find('input.product-info-qty-input').val();
        var shipTo = item.find('#shipTo').data('country');
        var shippingZoneId = item.find('input#shipping-zone-id').val();
        var shippingRateId = item.find('input#shipping-rate-id').val();
        var shipToCountryId = item.find('input#shipto-country-id').val();
        var shipToStateId = item.find('input#shipto-state-id').val();

        $.ajax({
          url: $(this).data('link'),
          type: 'POST',
          data: {
            'shipTo': shipTo,
            'shippingZoneId': shippingZoneId,
            'shippingRateId': shippingRateId,
            'shipToCountryId': shipToCountryId,
            'shipToStateId': shipToStateId,
            'quantity': qtt ? qtt : 1
          },
          complete: function(xhr, textStatus) {
            if (200 == xhr.status) {
              @include('theme::layouts.notification', ['message' => trans('theme.notify.item_added_to_cart'), 'type' => 'success', 'icon' => 'check-circle'])
              // Increase global cart item count by 1
              increaseCartItem(1);
            } else if (404 == xhr.status) {
              @include('theme::layouts.notification', ['message' => trans('theme.item_not_available'), 'type' => 'warning', 'icon' => 'info-circle'])
            } else if (444 == xhr.status) {
              @include('theme::layouts.notification', ['message' => trans('theme.notify.item_added_already_in_cart'), 'type' => 'info', 'icon' => 'info-circle'])
            } else if (409 == xhr.status) {
              @include('theme::layouts.notification', ['message' => trans('theme.out_of_stock'), 'type' => 'warning', 'icon' => 'info-circle'])
            } else {
              @include('theme::layouts.notification', ['message' => trans('theme.notify.failed'), 'type' => 'warning', 'icon' => 'times-circle'])
            }
          },
        });
      });

      // Add-to-wishlist
      $(".add-to-wishlist").off().on("click", function(e) {
        e.preventDefault();

        $.ajax({
          url: $(this).data('link'),
          type: 'get',
          complete: function(xhr, textStatus) {
            if (200 == xhr.status) {
              @include('theme::layouts.notification', ['message' => trans('theme.item_added_to_wishlist'), 'type' => 'success', 'icon' => 'check-circle'])
              increaseWishlistItem(1);
            } else if (401 == xhr.status) {
              location.href = '{{ route('customer.login') }}';
            } else if (404 == xhr.status) {
              @include('theme::layouts.notification', ['message' => trans('theme.item_not_available'), 'type' => 'warning', 'icon' => 'info-circle'])
            } else if (409 == xhr.status) {
              @include('theme::layouts.notification', ['message' => trans('theme.notify.item_added_already_in_wishlist'), 'type' => 'info', 'icon' => 'info-circle'])
            } else {
              @include('theme::layouts.notification', ['message' => trans('theme.notify.failed'), 'type' => 'warning', 'icon' => 'times-circle'])
            }
          },
        });
      });

      // Bootstrap fixes
      $('[data-toggle="tooltip"]').tooltip();

      // i-Check plugin
      $('.i-check, .i-radio').iCheck({
        checkboxClass: 'icheckbox_minimal',
        radioClass: 'iradio_minimal',
      });
      $('.i-check-blue, .i-radio-blue').iCheck({
        checkboxClass: 'icheckbox_minimal-blue',
        radioClass: 'iradio_minimal-blue',
      });

      // SelectBoxIt
      $(".selectBoxIt").selectBoxIt();

      // jqzoom
      $('#jqzoom, #quickViewZoom').jqzoom({
        zoomType: 'standard', //innerzoom/standard
        lens: true,
        preloadImages: false,
        // alwaysOn: true,
        showEffect: 'fadein', //show/fadein
        hideEffect: 'fadeout', //hide/fadeout
        fadeinSpeed: 'fast', //fast/slow/number
        fadeoutSpeed: 'fast', //fast/slow/number
        showPreload: true,
        zoomWidth: 450,
        zoomHeight: 450,
        // zoomWidth: window.screen.width - (window.screen.width * 0.5),
        // zoomHeight: window.screen.height - 340,
        xOffset: 10,
        yOffset: 0
      });

      //Datepicker
      $(".datepicker").datepicker({
        format: 'yyyy-mm-dd'
      });

      // Product qty field
      $(".product-info-qty-input").on('keyup', function() {
        var currentVal = parseInt($(this).val(), 10);
        var maxVal = parseInt($(this).data('max'), 10);
        var minVal = parseInt($(this).data('min'), 10);

        if (!currentVal || currentVal == "" || currentVal == "NaN") {
          currentVal = 1;
        } else if (maxVal < currentVal) {
          currentVal = maxVal;
        }

        if (currentVal < minVal) {
          currentVal = minVal;
        }

        $(this).val(currentVal);
      });

      $(".product-info-qty-plus").on('click', function(e) {
        e.preventDefault();
        var node = $(this).prev(".product-info-qty-input");
        var currentVal = parseInt(node.val(), 10);

        if (!currentVal || currentVal == "" || currentVal == "NaN") {
          currentVal = 0;
        }

        if (node.data('max') > currentVal) {
          node.val(currentVal + 1).change();
        } else {
          @include('theme::layouts.notification', ['message' => trans('theme.notify.max_item_stock'), 'type' => 'warning', 'icon' => 'times-circle'])
        }
      });

      $(".product-info-qty-minus").on('click', function(e) {
        e.preventDefault();
        var node = $(this).next(".product-info-qty-input");
        var currentVal = parseInt(node.val(), 10);

        if (currentVal == "NaN") {
          currentVal = node.data('min');
        }

        if (currentVal > node.data('min')) {
          $(this).next(".product-info-qty-input").val(currentVal - 1).change();
        } else {
          @include('theme::layouts.notification', ['message' => trans('theme.notify.minimum_order_qtt_reached'), 'type' => 'warning', 'icon' => 'times-circle'])
        }
      });
      // END Product qty field

      // Address form
      $("#address_country").on('change', function() {
        var country = $(this).val();
        var state_node = $('#address_state');

        $.ajax({
          delay: 250,
          data: "id=" + country,
          url: "{{ route('ajax.getCountryStates') }}",
          success: function(result) {
            var data = '<option value="">{{ trans('theme.placeholder.state') }}</option>';
            if (result.length !== 0) {
              data += $.map(result, function(val, id) {
                return '<option value="' + id + '">' + val + '</option>';
              })

              state_node.attr('required', 'required');
            } else {
              state_node.removeAttr('required');
            }

            state_node.html(data);

            state_node.trigger('change'); // Trigger the onchange event on state id
          }
        });
      });
      // END Address form
    }

    // Price Filters
    $("#price-slider").ionRangeSlider({
      hide_min_max: true,
      keyboard: true,
      min: {{ $priceRange['min'] ?? 0 }},
      max: {{ $priceRange['max'] ?? 5000 }},
      from: {{ Request::get('price') ? explode('-', Request::get('price'))[0] : $priceRange['min'] ?? 0 }},
      to: {{ Request::get('price') ? explode('-', Request::get('price'))[1] : $priceRange['max'] ?? 5000 }},
      step: 10,
      type: 'double',
      prefix: "{{ get_formated_currency_symbol() ?? '$' }}",
      grid: true,
      onFinish: function(data) {
        var href = removeQueryStringParameter(window.location.href, 'price'); //Remove currect price
        window.location.href = getFormatedUrlStr(href, 'price=' + data.from + '-' + data.to);
      },
    });
  }(window.jQuery, window, document));

  // Helpers
  function getFormatedValue(value = 0, dec = {{ config('system_settings.decimals', 2) }}) {
    value = value ? value : 0;
    return parseFloat(value).toFixed(dec);
  }

  function getFormatedPrice(value = 0, trim = true) {
    var value = getFormatedValue(value);
    var arr = value.split(".");

    if (arr[1]) {
      value = arr[1] > 0 ? arr[0] + '<sup class="price-fractional">' + arr[1] + '</sup>' : arr[0];
    }

    return "{{ get_currency_prefix() }}" + value + "{{ get_currency_suffix() }}";
  }

  /*
   * Get result from PHP helper functions
   *
   * @param  {str} funcName The PHP function name will be called
   * @param  {mix} args arguments need to pass into the PHP function
   *
   * @return {mix}
   */
  function getFromPHPHelper(funcName, args = null) {
    var url = "{{ route('helper.getFromPHPHelper') }}";
    var result = 0;
    jQuery.ajax({
      url: url,
      data: "funcName=" + funcName + "&args=" + args,
      async: false,
      success: function(v) {
        result = v;
      }
    });

    return result;
  }
</script>