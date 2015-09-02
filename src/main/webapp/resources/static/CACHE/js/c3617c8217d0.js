var wishket = (function(w, $) {
	"use strict";
	var ErrorMessagesInKorean = {
		requiredFields : "<i class=\"fa fa-exclamation-circle\"></i> 이 항목은 필수입니다.",
		badUrl : "<i class=\"fa fa-exclamation-circle\"></i> 올바른 URL을 입력하세요."
	};
	w.getCookie = function(name) {
		var cookieValue = null, i, cookie, cookies;
		if (document.cookie && document.cookie !== "") {
			cookies = document.cookie.split(';');
			for (i = 0; i < cookies.length; i++) {
				cookie = $.trim(cookies[i]);
				if (cookie.substring(0, name.length + 1) === (name + '=')) {
					cookieValue = decodeURIComponent(cookie
							.substring(name.length + 1));
					break;
				}
			}
		}
		return cookieValue;
	};
	w.csrfSafeMethod = function(method) {
		return (/^(GET|HEAD|OPTIONS|TRACE)$/).test(method);
	};
	w.notifications = {
		init : function() {
			$('a[data-behaviours~="archive"]').click(function() {
				w.notifications.checkAndSubmit($(this), 'archive');
			});
			$('a[data-behaviours~="delete"]').click(function() {
				w.notifications.checkAndSubmit($(this), 'delete');
			});
		},
		checkAndSubmit : function($ele, btn_val) {
			$ele.closest('tr').find('input').attr('checked', 'checked');
			$ele.closest('form').find('button[value="' + btn_val + '"]')
					.click();
			return false;
		}
	};
	w.client = {
		init : function() {
			$('#client-edit').click(function() {
				if ($(this).data("mode") === "edit") {
					$.ajax({
						dataType : "json",
						url : "/client/c/{{ request.user.client.id }}/",
						success : function(data, status, xhr) {
							$.each(data, function(i, value) {
								$("#" + i).val(value);
							});
						}
					});
				}
			});
		}
	};
	w.forms = {
		init : function() {
			$('.js-disable-on-click').click(function() {
				$(this).button('loading');
			});
			$.validate({
				validateOnBlur : false,
				language : ErrorMessagesInKorean
			});
		}
	};
	w.review = {
		init : function() {
			$.fn.raty.defaults.path = '/static/img';
			$.fn.raty.defaults.score = function() {
				return $(this).data('rating-score');
			};
			$.fn.raty.defaults.scoreName = function() {
				return $(this).data('rating-target-name');
			};
			$.fn.raty.defaults.target = function() {
				return '#' + $(this).data('rating-target-name');
			};
			$.fn.raty.defaults.halfShow = true;
			$.fn.raty.defaults.hints = [ '나쁨', '별로', '보통', '좋음', '매우 좋음' ];
			$.fn.raty.defaults.noRatedMsg = "평가 없음";
			$('.rating-md').each(
					function() {
						var $this = $(this), scoreName = $this
								.data('rating-target-name'), targetId = '#'
								+ scoreName;
						$this.raty({
							scoreName : scoreName,
							target : targetId,
							targetType : 'number',
							targetKeep : true,
							targetText : '0',
							starOn : 'star_on_md.png',
							starOff : 'star_off_md.png'
						});
					});
			$('.rating-lg').raty({
				starOn : 'star_on_lg.png',
				starOff : 'star_off_lg.png',
				width : 120
			});
			$('.rating-sm').raty({
				starOn : 'star_on_sm.png',
				starOff : 'star_on_sm.png'
			});
		},
		initCollapse : function() {
			$('.review-summary').on(
					'show.bs.collapse',
					function() {
						$(this).find('.collapse-btn').html(
								'간략히 보기 <i class="fa fa-caret-up"></i>');
					}).on(
					'hide.bs.collapse',
					function() {
						$(this).find('.collapse-btn').html(
								'자세히 보기 <i class="fa fa-caret-down"></i>');
					});
		}
	};
	w.init = function() {
		w.notifications.init();
		w.client.init();
		w.forms.init();
		w.review.init();
		w.review.initCollapse();
	};
	return w;
}(wishket || {}, jQuery));