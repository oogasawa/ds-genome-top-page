<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>


<div class="container">
  <div class="row">
    <div class="col-sm-6">
    <a href="${jbrowseUrl}">
      <h4>J Browse Genome Viewer</h4>
      <img src="static/images/jbrowse.png" width="250">
      </a>
      <p>AJAX based </p>
    </div>
    <div class="col-sm-6">
    <a href="${textsearchUrl}">
      <h4>Full Text Search</h4>
      <img src="static/images/text-search.png" width="250">
    </a>
      <p>Full text search of the GFF genome annotation file.</p>
    </div>

  </div>

  <div class="row">
    <div class="col-sm-6">
    <a href="${blastUrl}">
      <h4>BLAST (sequence server)</h4>
      <img src="static/images/BLAST.png" width="250">
     </a>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris...</p>
    </div>
    <div class="col-sm-6">
    <a href="${blatUrl}">
      <h4>Web BLAT</h4>
      <img src="static/images/BLAT.png" width="250">
      </a>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris...</p>
    </div>

  </div>
</div>

