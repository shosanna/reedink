//= require jquery
//= require jquery_ujs
//= require d3
//= require select2
//= require_tree .

function visualizeWeeklyReading(dataset) {
  var w = 400;
  var h = 150;
  var barPadding = 1;

  var svg = prepareSVG(w,h)

  svg.selectall("rect")
     .data(dataset)
     .enter()
     .append("rect")
     .attr("width", w / dataset.length - barPadding)
     .attr("height", function(d) {
       return d * 4;
     })
     .attr("y", function(d) {
       return h - d;
     })
     .attr("x", function(d,i) {
       return i * (w / dataset.length);
     });
}

function visualizeReadPages(dataset, pages) {
  var w = 200;
  var h = 40;

  var svg = prepareSVG(w,h);
  var scale = d3.scale.linear()
    .domain([0, pages])
    .range([0, w]);

  svg.selectAll("rect")
    .data(dataset)
    .enter()
    .append("rect")
    .attr("class", "bar")
    .attr("x", function(d, i) { return scale(d[0]); })
    .attr("width", function(d, i) { return scale(d[1] - d[0]) })
    .attr("height", h);
}

function prepareSVG(w,h) {
  var svg = d3.select(".d3-progress-bar")
    .append("svg")
    .attr("width", w)
    .attr("height", h);
  return svg;
}

$(function() {
  $(".select2-tags").each(function() {
    var data = $(this).attr("data-tags");
    if (data) {
      data = JSON.parse(data);
    }

    $(this).select2({
      tags: data || [],
      tokenSeparators: [',', ' ']
    });
  })
});
