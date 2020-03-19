document.addEventListener 'DOMContentLoaded', ->

  unless OriDomi.isSupported
    document.getElementById('unsupported').style.display = 'block'
    return

  logo = new OriDomi '.logo', shading: false, speed: 1000
  logo.stairs 17

  demos = [
    new OriDomi '.demo1', vPanels: 5, ripple: true
    new OriDomi '.demo1_1', vPanels: 5, ripple: true
    new OriDomi '.demo1_2', vPanels: 5, ripple: true
    new OriDomi '.demo1_3', vPanels: 5, ripple: true
    new OriDomi '.demo1_4', vPanels: 5, ripple: true
    new OriDomi '.demo1_5', vPanels: 5, ripple: true
    new OriDomi '.demo1_6', vPanels: 5, ripple: true
    new OriDomi '.demo4', vPanels: 4, ripple: true
    new OriDomi '.demo6', hPanels: 4, ripple: true, shading: false
  ]

  setTimeout ->
    demos[0].accordion 30
    demos[1].accordion 30
    demos[2].accordion 30
    demos[3].accordion 30
    demos[4].accordion 30
    demos[5].accordion 30
    demos[6].accordion 30
    demos[7].accordion 30
    demos[8].accordion 30
  , 1000


  methods = ['accordion', 'stairs', 'curl', 'reveal', 'foldUp', 'ramp', 'twist', 'fracture']

  document.getElementById('demos').addEventListener 'click', (e) ->

    return unless (el = e.target).className is 'button'
    n      = el.getAttribute 'data-n'
    method = methods[Math.abs Math.floor Math.random() * methods.length - Math.random()]
    angle  = Math.floor Math.random() * 80 * (if Math.random() > .5 then -1 else 1)

    demos[n][method] if method isnt 'foldUp' then angle else undefined
    angle = '' if method is 'foldUp'

    el.parentNode.getElementsByClassName('label')[0].innerHTML = "#{ method }(#{ angle })"

  , false

