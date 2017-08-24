/**
    Equal Heights Plugin
    Equalize the heights of elements. Great for columns or any elements
    that need to be the same size (floats, etc).
  
    Version 1.01
    Updated 1/30/2014
 
    Copyright (c) 2008 Rob Glazebrook (cssnewbie.com) 
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
    Usage: $(object).equalHeights([minHeight], [maxHeight]);
  
    Example 1: $(".cols").equalHeights(); Sets all columns to the same height.
    Example 2: $(".cols").equalHeights(400); Sets all cols to at least 400px tall.
    Example 3: $(".cols").equalHeights(100,300); Cols are at least 100 but no more
    than 300 pixels tall. Elements with too much content will gain a scrollbar.
**/

   (function($) {
     $.fn.equalHeights = function(minHeight, maxHeight) {
      tallest = (minHeight) ? minHeight : 0;
      this.each(function() {
       if($(this).height() > tallest) {
        tallest = $(this).height();
       }
      });
      if((maxHeight) && tallest > maxHeight) tallest = maxHeight;
      return this.each(function() {
       $(this).height(tallest);
     });
    }
  })(jQuery);