{
    layout => 'sidebar',
    scripts => [ "/stc/common.js",
                 "/stc/faction.js",
                 "/stc/game.js",
                 "/stc/map.js"],
    title => 'Map Editor',
    content => read_then_close(*DATA)
}

__DATA__
<div id="error"></div>

<h4>ID</h4>
<div id="map-id"></div>

<h4>Map</h4>
<div id="map-container">
  <canvas id="map" width="800" height="500" style="display: none">
    Browser not supported.
  </canvas>
</div>

<h4>Data</h4>
<div>
  <textarea id="map-data" rows=13 cols=30 oninput="javascript:forbidSave()">
  </textarea>
</div>
<div>
  <button id="save" onclick="javascript:saveMap()">Save</button>
  <button id="preview" onclick="javascript:previewMap()">Preview</button>
</div>

<h4>Games</h4>
<table id="games-played" class="gamelist"></table>

<h4>Faction Info</h4>

<p>
    Deviation from expected score, based on performance of other
    players, and adjusted for estimated player skill.
</p>

<table id="faction-info" class="gamelist"></table>

<script>showMap();</script>
