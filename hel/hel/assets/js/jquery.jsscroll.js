(function($) {
    $.fn.extend({
        jsScroll: function(options) {
            var defaults = {
                // 是否一直显示滚动条
                alwaysVisible: false,
                // 滚动区域高度
                height: 'auto',
                // 滚动区域宽度
                width: 'auto',
                // 滚动区域类名
                wrapperClass: 'js-scroll-wrapper',
                // 滚动条位置
                position: 'right',
                // 滚动条相对边界距离 
                distance: '0px',
                // 滚动条水平方向时候的高度
                railHeight: '15px',
                // 滚动条和滚动块的宽度
                railWidth: '15px',
                // 滚动条的颜色
                railColor: 'rgba(206, 206, 206, 0.8)',
                // 滚动条的类
                railClass: 'js-scroll-rail',
                // 是否显示rail
                railVisible: true,
                // 滚动条的圆角
                railBorderRadius: '7px',
                // 滚动块的颜色
                barColor: 'rgba(33, 150, 243, 1)',
                // 滚动块最小的长度
                minBarHeight: '10px',
                // 滚动块的类名
                barClass: 'js-scroll-bar',
                // 滚动块的圆角
                barBorderRadius: '7px',
                // 滚轮滚动对应的滚动距离
                wheelStep: 20,
                // 触摸滚动对应的滚动距离
                touchScrollStep: 200,
                // 检测当我们滚动到最顶端或者最底端的时候，鼠标滚轮滚动是否要带动整个页面的滚动
                allowPageScroll: false,
                scrollPosiion: 'vertical'
            };

            var o = $.extend(defaults, options);
            
            this.each(function() {
                // 一些私有变量
                var div = '<div></div>'
                    , isDrag = false
                    , percentScroll
                    , isOverPanel
                    , isOverBar
                    , queueHide
                    , releaseScroll = false
                    , barHeight
                    , barWidth
                    , touchDif
                    ;

                var target = $(this);
                
                // 如果之前已经装备了滚动条，则不再重复声明，并且根据指令执行对应的动作
                if (target.parent().hasClass(o.wrapperClass)) {
                    var offset = o.scrollPosiion === 'horizontal' ? target.scrollLeft() : target.scrollTop();

                    bar = target.siblings('.' + o.barClass);
                    rail = target.siblings('.' + o.railClass);

                    setBarHeight();
                    var height
                        , width
                        ;
                    if ($.isPlainObject(options)) {
                        if (o.scrollPosiion === 'horizontal') {
                            if ('width' in options && options.width === 'auto') {
                                target.parent().css('width', 'auto');
                                target.css('width', 'auto');
                                width = target.parent().parent().height();
                                target.parent().css('width', width);
                                target.css('width', width);
                            } else if ('width' in options) {

                            }
                        } else {
                            if ('height' in options && options.height === 'auto') {
                                target.parent().css('height', 'auto');
                                target.css('height', 'auto');
                                height = target.parent().parent().height();
                                target.parent().css('height', height);
                                target.css('height', height);
                            } else if ('height' in options) {
                                height = options.height;
                                target.parent().css('height', height);
                                target.css('height', height);
                            }                            
                        }


                        if ('scrollTo' in options) {
                            offset = parseInt(options.scrollTo);
                        } else if ('scrollBy' in options) {
                            offset += parseInt(options.scrollBy);
                        } else if ('destroy' in options) {
                            bar.remove();
                            rail.remove();
                            target.unwrap();
                            return;
                        }
                        scrollTargetContent(offset, false, true);
                    }
                    return;
                }

                if (o.scrollPosiion === 'horizontal') {
                    o.width = (o.width === 'auto') ? target.parent().width() : o.width
                } else {
                    o.height = (o.height === 'auto') ? target.parent().height() : o.height; 
                }

                // 如果没有装备滚动条但配置中含有destroy，则不对其进行操作
                if ($.isPlainObject(options)) {
                    if ('destroy' in options) {
                        return;
                    }
                }

                // 内容和样式
                var wrapper = $(div)
                                .addClass(o.wrapperClass)
                                .css({
                                    overflow: 'hidden',
                                    position: 'relative',
                                    height: o.height,
                                    width: o.width
                                })
                                ;
                target.css({
                    overflow: 'hidden',
                    height: o.height,
                    width: o.width
                })

                // alert(target[0].style.width);

                var rail = $(div)
                            .addClass(o.railClass)
                            .css({
                                position: 'absolute',
                                // top: '0',
                                height: (o.scrollPosiion === 'horizontal') ? o.railHeight : '100%',
                                width: (o.scrollPosiion === 'horizontal') ? '100%' : o.railWidth,
                                backgroundColor: o.railColor,
                                zIndex: 90,
                                display: (o.alwaysVisible && o.railVisible) ? 'block' : 'none',
                                borderRadius: o.railBorderRadius
                            })
                            ;

                var bar = $(div)
                            .addClass(o.barClass)
                            .css({
                                position: 'absolute',
                                // top: '0',
                                // width: o.railWidth,
                                backgroundColor: o.barColor,
                                zIndex: 99,
                                display: o.alwaysVisible ? 'block' : 'none',
                                borderRadius: o.barBorderRadius
                            })

                var posCss;
                if (o.scrollPosiion === 'horizontal') {
                    // 水平滚动条
                    if (o.position === 'top') {
                        posCss = { top: o.distance, left: '0' };
                    }
                    if (o.position === 'bottom') {
                        posCss = { bottom: o.distance, left: '0' };
                    }                    
                } else {
                    // 垂直滚动条
                    if (o.position === 'left') {
                        posCss = { left: o.distance, top: '0' };
                    }
                    if (o.position === 'right') {
                        posCss = { right: o.distance, top: '0' };
                    }
                }


                rail.css(posCss);
                bar.css(posCss);
                setBarHeight();

                target.wrap(wrapper);
                target.parent().append(rail);
                target.parent().append(bar);

                // 行为
                // 拖动滑块事件
                bar.on('mousedown', function(e) {
                    var pageY = e.pageY
                        , pageX = e.pageX
                        , barTop = parseFloat(bar.css('top'))
                        , barLeft = parseFloat(bar.css('left'))
                        ;
                    isDrag = true;
                    $(document).on('mousemove.jsScroll', function(e) {
                        var distanceY = e.pageY - pageY
                            , distanceX = e.pageX - pageX
                            ;
                        if (o.scrollPosiion === 'horizontal') {
                            bar.css({
                                left: barLeft + distanceX
                            })
                            scrollTargetContent(0, bar.position().left, false);
                        } else {
                            bar.css({
                                top: barTop + distanceY
                            });
                            scrollTargetContent(0, bar.position().top, false);
                        }
                        
                    })
                    $(document).on('mouseup.jsScroll', function(e) {
                        isDrag = false;
                        $(document).unbind('.jsScroll');
                    })
                    return false;
                }).on('selectstart.jsScroll', function(e) {
                    // 点击滑动块的时候不允许选择文本
                    e.preventDefault();
                    e.stopPropagation();
                    return false;
                })

                // 滚动条的显示和隐藏
                rail.hover(function() {
                    showBar();
                }, function() {
                    hideBar();
                });

                bar.hover(function() {
                    isOverBar = true;
                }, function() {
                    isOverBar = false;
                });

                target.hover(function() {
                    isOverPanel = true;
                    showBar();
                    hideBar();
                }, function() {
                    isOverPanel = false;
                    hideBar();
                });

                attachWheel(this);


                // 滚动条适配到移动端
                target.on('touchstart', function(e, b) {
                    if (e.originalEvent.touches.length) {
                        touchDif = o.scrollPosiion === 'horizontal' ? e.originalEvent.touches[0].pageX : e.originalEvent.touches[0].pageY;
                    }
                });

                target.bind('touchmove', function(e) {
                    if (!releaseScroll) {
                        e.originalEvent.preventDefault();
                    }
                    if (e.originalEvent.touches.length) {
                        var endPos = o.scrollPosiion === 'horizontal' ? e.originalEvent.touches[0].pageX : e.originalEvent.touches[0].pageY;
                        var diff = (touchDif - endPos) / o.touchScrollStep;
                        scrollTargetContent(diff, true);
                        touchDif = endPos;
                    }
                })


                // 设置滑动块的长度
                function setBarHeight() {
                    if (o.scrollPosiion === 'horizontal') {
                        barWidth = Math.max(( getStyleWidth(target, false) / target[0].scrollWidth) * getStyleWidth(target, false), parseFloat(o.minBarHeight));
                        bar.css({
                            width: '' + parseInt(barWidth) + 'px',
                            height: o.railHeight
                        })
                        $('h1').text($('h1').text() +  ' ' + getStyleWidth(target, false) + ' ' + target[0].scrollWidth + ' ' + target.css('width') + ' ' + barWidth);
                        return;
                    }
                    barHeight = Math.max(( target.outerHeight(false) / target[0].scrollHeight ) * target.outerHeight(false),  parseFloat(o.minBarHeight))
                        ;
                    bar.css({
                        height: '' + parseInt(barHeight) + 'px', // 高度修改为整数，如果是浮点的话，在计算滑块位置的时候由于取整原因而导致的溢出
                        width: o.railWidth
                    });
                }
                // 滚动内容区域
                function scrollTargetContent(y, isWheel, isJump) {
                    if (o.scrollPosiion === 'horizontal') {
                        var distanceX = y;
                        var maxLeft = getStyleWidth(target, false) - getStyleWidth(bar, false);
                        if (isWheel) {
                            var barLeft = parseFloat(bar.css('left')) + y * o.wheelStep / 100 * getStyleWidth(bar, false);
                            barLeft = Math.min(Math.max(barLeft, 0), maxLeft);
                            barLeft = y > 0 ? Math.ceil(barLeft) : Math.floor(barLeft);
                            bar.css({left: '' + barLeft + 'px'});
                        }
                        if (arguments.length > 2 && isJump) {
                            var offsetLeft = distanceX / target[0].scrollWidth * getStyleWidth(target, false);
                            offsetLeft = Math.min(Math.max(offsetLeft, 0), maxLeft);
                            bar.css({left: '' + offsetLeft + 'px'});
                        }
                        percentScroll = parseFloat(bar.css('left')) / (getStyleWidth(target, false) - getStyleWidth(bar, false));
                        distanceX = percentScroll * (target[0].scrollWidth - parseFloat(getStyleWidth(target, false)));

                        target.scrollLeft(distanceX);

                    } else {
                        var distanceY = y;
                        var maxTop = target.outerHeight() - bar.outerHeight();
                        // 如果是鼠标滚轮滚动，需要确定当前bar的位置
                        if (isWheel) {
                            // 后面的一部分为每次滚动为一页的百分之 y * wheelStep
                            var barTop = parseFloat(bar.css('top')) + y * o.wheelStep / 100  * bar.outerHeight(); 
                            barTop = Math.min(Math.max(barTop, 0), maxTop);
                            // if scrolling down, make sure a fractional change to the
                            // scroll position isn't rounded away when the scrollbar's CSS is set
                            // this flooring of delta would happened automatically when
                            // bar.css is set below, but we floor here for clarity
                            barTop = y > 0 ? Math.ceil(barTop) : Math.floor(barTop);
                            bar.css({top: '' + barTop + 'px'});
                        }

                        if (arguments.length > 2 && isJump) {
                            var offsetTop = distanceY / target[0].scrollHeight * target.outerHeight();
                            offsetTop = Math.min(maxTop, Math.max(offsetTop, 0));
                            bar.css({top: '' + offsetTop + 'px'});
                        }

                        percentScroll = parseFloat(bar.css('top')) / (target.outerHeight() - bar.outerHeight());
                        distanceY = percentScroll * (target[0].scrollHeight - parseFloat(target.outerHeight()));

                        target.scrollTop(distanceY);                    
                    }



                    showBar();

                    hideBar();
                }

                function _onWheel(e) {
                    if (!isOverPanel) {
                        return;
                    }
                    var e = e || window.event;
                    var delta = 0;
                    if (e.wheelDelta) {
                        delta = -e.wheelDelta / 120; // 其他浏览器向下滚动是120
                    }
                    if (e.detail) {
                        delta = e.detail / 3; // 火狐向下滚动是-3
                    }


                    var eTarget = e.target || e.srcTarget || e.srcElement; // ie 6-8的srcElement 和其他浏览器的target
                    if($(eTarget).closest('.' + o.wrapperClass).is(target.parent())) {
                        scrollTargetContent(delta, true);
                    }
            
                    // 如果releaseScroll为false，阻止冒泡，让外部滚动条无法滑动
                    if (e.preventDefault && !releaseScroll) { e.preventDefault(); }
                    if (!releaseScroll) { e.returnValue = false; }
                }
                // 绑定鼠标滚轮事件
                function attachWheel(elem) {
                    if (window.addEventListener) {
                        elem.addEventListener('DOMMouseScroll', _onWheel, false );
                        elem.addEventListener('mousewheel', _onWheel, false );
                    } else {
                        elem.attachEvent('onmousewheel', _onWheel);
                    }
                }

                function showBar() {
                    clearTimeout(queueHide);
                    
                    if (percentScroll === 0 || percentScroll === 1) {
                        releaseScroll = o.allowPageScroll;

                    } else {
                        releaseScroll = false;
                    }


                    if (barHeight >= target.outerHeight()) {
                        releaseScroll = true;
                        return;
                    }
                    bar.stop(true, true).fadeIn('fast');
                    if (o.railVisible) {
                        rail.stop(true, true).fadeIn('fast');
                    }
                }

                function hideBar() {
                    if (!o.alwaysVisible) {
                        if (!isOverPanel && !isOverBar && !isDrag) {
                            queueHide = setTimeout(function() {
                                if (!isOverPanel) {
                                    bar.fadeOut('slow');
                                    rail.fadeOut('slow');
                                }
                            }, 1000);                                    
                        }
                    }
                }

                function getStyleWidth(elem, border) {
                    if (arguments.length < 2) {
                        border = false;
                    }
                    if ($(elem).outerWidth(border) !== 0) {
                        return $(elem).outerWidth(border);
                    } else {
                        console.log($(elem)[0].style.borderWidth);
                        return parseFloat($(elem)[0].style.width);
                    }
                }
            })

            return this;
        }
    })
})(jQuery);