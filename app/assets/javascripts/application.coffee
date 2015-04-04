#= require jquery
#= require jquery_ujs
#= require d3
#= require dataTables/jquery.dataTables
#= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
#= require select2
#= require_tree .

# SKILLS TABLE
window.skillsTable = (data) ->
  rowHeight = 20
  width = 600

  svg = prepareSVG(width, 300, '.svg-table')

  # DATA = [{ skill: "Vim", data: [{ date: 1.1.2015, report: true }] }]
  row = svg.selectAll('g')
        .data(data)
        .enter()
        .append('g')
        .attr('height', rowHeight)
        .attr('transform', (d, i) -> "translate(50, #{i*22})")

  today = new Date()
  todayString = "#{today.getFullYear()}-#{today.getMonth() + 1}-#{today.getDate()}"

  box = row.selectAll('rect').data((d) -> d.data)
    .enter()
    .append('rect')
    .attr('width', 20)
    .attr('x', (d, i) -> i * 22)
    .attr('height', '20')
    .attr "class", (d) ->
      if d.report
        "checked-box"
      else
        if d.date == todayString
          "unchecked-today-box"
        else
          "unchecked-box"
    .on 'mouseover', (d) ->
      if d.date == todayString
        d3.select(this)
          .attr('class','checked-box')
    .on 'mouseleave', (d) ->
      if !d.report && d.date == todayString
        d3.select(this).attr('class','unchecked-today-box')

  text = svg.selectAll('text').data(data)
    .enter()
    .append('text')
    .text((d) -> d.skill)
    .attr('y', (d,i) -> (i * 23) + 11)
    .attr('x', 0)

# WEEKLY READING BAR CHART
window.visualizeWeeklyReading = (dataset, days) ->
  # DATASET = [0,0,50,15,0,5,60]
  w = $('.container').width()
  h = 200
  barPadding = 1
  chartPaddingY = 20
  chartPaddingX = 50

  svg = prepareSVG(w, h + 30, '.d3-weekly-reading-chart')

  # SCALES
  yScale = d3.scale.linear()
   .domain([0, d3.max(dataset)])
   .range([0, h])

  yScaleAxis = d3.scale.linear()
    .domain([0, d3.max(dataset) + chartPaddingY])
    .range([h, 0])

  xScaleAxis = d3.scale.ordinal()
    .domain(['last week', 'today'])
    .rangePoints([0, w])

  yAxis = d3.svg.axis()
    .scale(yScaleAxis)
    .orient('right')
    .ticks(5)

  xAxis = d3.svg.axis()
    .scale(xScaleAxis)
    .orient('bottom')

  # BARS
  svg.append('g')
    .attr('class', 'bars')
    .selectAll('rect')
    .data(dataset)
    .enter()
    .append('rect')
    .attr('class', 'bar')
    .attr('width', w / dataset.length - barPadding)
    .attr('height', (d) -> yScale(d))
    .attr('y', (d) -> (h - yScale(d)))
    .attr('x', (d, i) -> (i * w / dataset.length) + chartPaddingX)

  # DAY OF THE WEEK TEXTS
  svg.append('g')
    .attr('class', 'texts')
    .selectAll('text')
    .data(days)
    .enter()
    .append('text')
    .text((d) -> d)
    .attr('x', (d, i) -> i * w / days.length + 5 + chartPaddingX )
    .attr('y', (d) -> h - 10)
    .attr('font-size', '14px')
    .attr('fill', 'black')

  # AXIS
  svg.append('g')
     .attr('class', 'axis y-axis')
     .call(yAxis)
  svg.append('g')
     .attr('class', 'axis x-axis')
     .call(xAxis)
      .attr("transform", "translate(0, #{h})")

  svg.select(".x-axis .tick:nth-child(1)")
     .attr("transform", "translate(25, 0)")

  svg.select(".x-axis .tick:nth-child(2)")
     .attr("transform", "translate(#{w - 20}, 0)")

# READ PAGES PER A BOOK BAR
window.visualizeReadPages = (dataset, pages) ->
  # DATASET = [[0,10], [10,50], [70,110]]
  w = 200
  h = 40
  svg = prepareSVG(w, h, '.d3-progress-bar')
  scale = d3.scale
    .linear()
    .domain([ 0, pages ])
    .range([ 0, w ])

  svg.selectAll('rect')
    .data(dataset)
    .enter()
    .append('rect')
    .attr('class', 'bar')
    .attr('x', (d, i) -> scale d[0])
    .attr('width', (d, i) -> scale d[1] - d[0])
    .attr('height', h)

# PREPARE SVG HELPER METHOD
window.prepareSVG = (w, h, selector) ->
  svg = d3.select(selector).append('svg').attr('width', w).attr('height', h)
  svg

# OTHER
$ ->
  $('.select2-tags').each ->
    data = $(this).attr('data-tags')
    if data
      data = JSON.parse(data)
    $(this).select2
      tags: data or []
      tokenSeparators: [
        ','
        ' '
      ]

  $(".books-table").dataTable({ order: [[3, 'desc']] })
