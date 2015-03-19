//= require jquery
//= require jquery_ujs
//= require d3
//= require_tree .

function visualizeReadPages(dataset, pages) {
  var w = 200;
  var h = 40;

  svg = prepareSVG(w,h);
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
