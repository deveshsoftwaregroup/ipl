<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib uri="WEB-INF/sportmgmt.tld" prefix="s" %> 
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	<style>
    #ajaxloader {
    border: 16px solid #f3f3f3; /* Light grey */
    border-top: 16px solid blue;
 	border-right: 16px solid green;
 	border-bottom: 16px solid red;
 	border-left: 16px solid pink;
    border-radius: 50%;
    width: 50px;
    height: 50px;
    animation: spin 1s linear infinite;
    position: fixed;
    left: 50%;
    top: 50%;
    margin-left: -32px; 
    margin-top: -32px;
    z-index: 999;
    display:none;
}
.mask{ background: #000; opacity: 0.5; position:fixed; top: 0; left: 0; width: 100%; height:100%;}


@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}
</style>
<s:sportExt retrieve="deadLine" />
<main id="mainContent" tabindex="0" class="ism league">		
            <div class="addsbanner-lft"></div>
			<div class="addsbanner-rgt"></div>
            <div class="league-pusher leaguejs-page-transition">
                <!-- Primary content -->
                <div id="leaguer-main" class="league-main">
					<div>
						<div id="team-header">
							<div>
								<div class="ism-copy">
                                	<h3 style="color: #193782;"><i class="fa fa-angle-double-right" style="color: #f00;"></i> Select playing 11</h3>
                        			
                        		 </div>
								<!-- <div class="league-copy">									
								</div> -->

								<!-- Deadline Bar -->
								<div class="league-deadline-bar">
									<h4 class="league-deadline-bar__heading">Gameweek ${gameWeekNumber} Deadline:</h4>
									<time datetime="2016-08-27T10:30:00Z" class="league-deadline-bar__deadline">${deadline}</time>
								</div>

							</div>
						</div>

						<section>
							<div id="leaguer-errors" class="league-alert-wrap">
								<div></div>
							</div>
							<div id="leaguer-info" class="league-alert-wrap">
								<div>
									<div id="leaguejs-squad-info" tabindex="0"></div>
								</div>
							</div>
							
							<div class="league-squad-wrapper">
								<div class="leaguejs-a11y-tabs league-tabs">
									<section id="leaguer-summary" class="league-pitch" role="tabpanel">
										<div tabindex="0">
											<div class="league-element-row league-element-row--pitch">
												<div class="league-pitch__unit league-pitch__unit--4"></div>
												<div id="leaguer-pos1" class="league-pitch__unit league-pitch__unit--4">
													<div class="league-transfer--original">
													<s:sport position="1" playerType="wk"/>
														<div class="league-element" tabindex="0">
															<div class="leaguejs-menu check_1">
															<c:if test="${not empty clubId and clubId ne ''}">
																<spring:message code="club_${clubId}_image" var="imageSrc" />
															</c:if>
																<picture>
																	<img src="/SportMgmt/images/wk_${imageSrc}"  alt="Burnley" title="Burnleyyy" class="league-shirt league-element__shirt">
																</picture>
																<div class="league-element__name">${playerName}</div>
																<div class="league-element__data">${price}</div>
																<div class="league-element__controls">
																	<div class="leaguejs-remove league-element__control league-element__control--primary">
																		<input class="1-box" type="checkbox" name="boxes" value="check_1" title="Make Substitude" <c:if test="${isPlaying eq 'Y'}">checked</c:if> onclick="activatePlayer('${sessionScope.userId}','${gameClubPlayerId}',this);">
																	</div>
																	<%--  <div class="leaguejs-info league-element__control league-element__control--info">
																		<a href="#" data-toggle="modal" data-target="#myModal-1" title="View player information" class="fa fa-info" onclick="showPlayerDetails('${gameClubPlayerId}');"></a>
																	</div> --%> 
																	<div id="myModal-1" class="modal fade" role="dialog">
																	  <div class="modal-dialog">
																		<div class="modal-content">
																		  <div class="modal-header">
																			<button type="button" class="close" data-dleagueiss="modal">&times;</button>
																			<h4 class="modal-title">player information</h4>
																		  </div>
																		  <div class="modal-body">
																			<p>No information found.</p>
																		  </div>
																		</div>

																	  </div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div id="leaguer-pos2" class="league-pitch__unit league-pitch__unit--4">
													<div class="league-transfer--original">
													<s:sport position="2" playerType="wk"/>
														<div class="league-element" tabindex="0">
															<div class="leaguejs-menu check_2">
															<c:set var="imageSrc" value="" />
															<c:if test="${not empty clubId and clubId ne ''}">
																<spring:message code="club_${clubId}_image" var="imageSrc" />
															</c:if>																<picture>
																	<img src="/SportMgmt/images/wk_${imageSrc}"  alt="West Brom" title="West Brom" class="league-shirt league-element__shirt">
																</picture>
																<div class="league-element__name">${playerName}</div>
																<div class="league-element__data">${price}</div>
																<div class="league-element__controls">
																	<div class="leaguejs-remove league-element__control league-element__control--primary">
																		<input class="2-box" type="checkbox" name="boxes" value="check_2" <c:if test="${isPlaying eq 'Y'}">checked</c:if> onclick="activatePlayer('${sessionScope.userId}','${gameClubPlayerId}',this);">
																	</div>
																	<%-- <div class="leaguejs-info league-element__control league-element__control--info">
																		<a href="javascript:void(0);" title="View player information" class="fa fa-info" onclick="showPlayerDetails('${gameClubPlayerId}');"></a>
																	</div> --%>
																</div>
															</div>

														</div>
													</div>
												</div>
												
												<div class="league-pitch__unit league-pitch__unit--4"></div>
											</div>

											<div class="league-element-row league-element-row--pitch">
												<div id="leaguer-pos3" class="league-pitch__unit league-pitch__unit--5">
													<div class="league-transfer--original">
													<s:sport position="1" playerType="bat"/>
														<div class="league-element" tabindex="0">
														<c:set var="imageSrc" value="" />
														<c:if test="${not empty clubId and clubId ne ''}">
																<spring:message code="club_${clubId}_image" var="imageSrc" />
															</c:if>		
															<div class="leaguejs-menu check_3">
																<picture>
																	<img src="/SportMgmt/images/bat_${imageSrc}"  alt="West Brom" title="West Brom" class="league-shirt league-element__shirt">
																</picture>
																<div class="league-element__name">${playerName}</div>
																<div class="league-element__data">${price}</div>
																<div class="league-element__controls">
																	<div class="leaguejs-remove league-element__control league-element__control--primary">
																		<input class="3-box" type="checkbox" name="boxes" value="check_3" <c:if test="${isPlaying eq 'Y'}">checked</c:if> onclick="activatePlayer('${sessionScope.userId}','${gameClubPlayerId}',this);">
																	</div>
																	<%-- <div class="leaguejs-info league-element__control league-element__control--info">
																		<a href="javascript:void(0);" title="View player information" class="fa fa-info" onclick="showPlayerDetails('${gameClubPlayerId}');"></a>
																	</div> --%>
																</div>
															</div>

														</div>
													</div>
												</div>
												<div id="leaguer-pos4" class="league-pitch__unit league-pitch__unit--5">
													<div class="league-transfer--original">
													<s:sport position="2" playerType="bat"/>
														<div class="league-element" tabindex="0">
														<c:set var="imageSrc" value="" />
														<c:if test="${not empty clubId and clubId ne ''}">
																<spring:message code="club_${clubId}_image" var="imageSrc" />
															</c:if>		
															<div class="leaguejs-menu check_4">
																<picture>
																	<img src="/SportMgmt/images/bat_${imageSrc}" alt="West Ham" title="West Ham" class="league-shirt league-element__shirt">
																</picture>
																<div class="league-element__name">${playerName}</div>
																<div class="league-element__data">${price}</div>
																<div class="league-element__controls">
																	<div class="leaguejs-remove league-element__control league-element__control--primary">
																		<input class="4-box" type="checkbox" name="boxes" value="check_4" <c:if test="${isPlaying eq 'Y'}">checked</c:if> onclick="activatePlayer('${sessionScope.userId}','${gameClubPlayerId}',this);"/>
																	</div>
																	<%-- <div class="leaguejs-info league-element__control league-element__control--info">
																		<a href="javascript:void(0);" title="View player information" class="fa fa-info" onclick="showPlayerDetails('${gameClubPlayerId}');"></a>
																	</div> --%>
																</div>
															</div>

														</div>
													</div>
												</div>
												<div id="leaguer-pos5" class="league-pitch__unit league-pitch__unit--5">
													<div class="league-transfer--original">
													<s:sport position="3" playerType="bat"/>
														<div class="league-element" tabindex="0">
														<c:if test="${not empty clubId and clubId ne ''}">
																<spring:message code="club_${clubId}_image" var="imageSrc" />
															</c:if>		
															<div class="leaguejs-menu check_5">
																<picture>
																	<img src="/SportMgmt/images/bat_${imageSrc}"  alt="Man Utd" title="Man Utd" class="league-shirt league-element__shirt">
																</picture>
																<div class="league-element__name">${playerName}</div>
																<div class="league-element__data">${price}</div>
																<div class="league-element__controls">
																	<div class="leaguejs-remove league-element__control league-element__control--primary">
																		<input class="5-box" type="checkbox" name="boxes" value="check_5" <c:if test="${isPlaying eq 'Y'}">checked</c:if> onclick="activatePlayer('${sessionScope.userId}','${gameClubPlayerId}',this);"/>
																	</div>
																	<%-- <div class="leaguejs-info league-element__control league-element__control--info">
																		<a href="javascript:void(0);" title="View player information" class="fa fa-info" onclick="showPlayerDetails('${gameClubPlayerId}');"></a>
																	</div> --%>
																</div>
															</div>

														</div>
													</div>
												</div>
												<div id="leaguer-pos6" class="league-pitch__unit league-pitch__unit--5">
													<div class="league-transfer--original">
														<s:sport position="4" playerType="bat"/>
														<div class="league-element" tabindex="0">
															<div class="leaguejs-menu check_6">
															<c:if test="${not empty clubId and clubId ne ''}">
																<spring:message code="club_${clubId}_image" var="imageSrc" />
															</c:if>		
																<picture>
																	<img src="/SportMgmt/images/bat_${imageSrc}"  alt="Spurs" title="Spurs" class="league-shirt league-element__shirt">
																</picture>
																<div class="league-element__name">${playerName}</div>
																<div class="league-element__data">${price}</div>
																<div class="league-element__controls">
																	<div class="leaguejs-remove league-element__control league-element__control--primary">
																		<input class="6-box" type="checkbox" name="boxes" value="check_6" <c:if test="${isPlaying eq 'Y'}">checked</c:if> onclick="activatePlayer('${sessionScope.userId}','${gameClubPlayerId}',this);"/>
																	</div>
																	<%-- <div class="leaguejs-info league-element__control league-element__control--info">
																		<a href="javascript:void(0);" title="View player information" class="fa fa-info" onclick="showPlayerDetails('${gameClubPlayerId}');"></a>
																	</div> --%>
																</div>
															</div>

														</div>
													</div>
												</div>
												<div id="leaguer-pos7" class="league-pitch__unit league-pitch__unit--5">
													<div class="league-transfer--original">
													<s:sport position="5" playerType="bat"/>
														<div class="league-element" tabindex="0">
															<div class="leaguejs-menu check_7">
															<c:if test="${not empty clubId and clubId ne ''}">
																<spring:message code="club_${clubId}_image" var="imageSrc" />
															</c:if>		
																<picture>
																	<img src="/SportMgmt/images/bat_${imageSrc}"  alt="Hull" title="Hull" class="league-shirt league-element__shirt">
																</picture>
																<div class="league-element__name">${playerName}</div>
																<div class="league-element__data">${price}</div>
																<div class="league-element__controls">
																	<div class="leaguejs-remove league-element__control league-element__control--primary">
																		<input class="7-box" type="checkbox" name="boxes" value="check_7" <c:if test="${isPlaying eq 'Y'}">checked</c:if> onclick="activatePlayer('${sessionScope.userId}','${gameClubPlayerId}',this);"/>
																	</div>
																	<%-- <div class="leaguejs-info league-element__control league-element__control--info">
																		<a href="javascript:void(0);" title="View player information" class="fa fa-info" onclick="showPlayerDetails('${gameClubPlayerId}');"></a>
																	</div> --%>
																</div>
															</div>

														</div>
													</div>
												</div>
											</div>
		
											<div class="league-element-row league-element-row--pitch">
												<div id="leaguer-pos13" class="league-pitch__unit league-pitch__unit--3">
													<div class="league-transfer--original">
													<s:sport position="1" playerType="ar"/>
														<div class="league-element" tabindex="0">
														<c:if test="${not empty clubId and clubId ne ''}">
																<spring:message code="club_${clubId}_image" var="imageSrc" />
															</c:if>		
															<div class="leaguejs-menu check_13">
																<picture>
																	<img src="/SportMgmt/images/ar_${imageSrc}"  alt="Middlesbrough" title="Middlesbrough" class="league-shirt league-element__shirt">
																</picture>
																<div class="league-element__name">${playerName}</div>
																<div class="league-element__data">${price}</div>
																<div class="league-element__controls">
																	<div class="leaguejs-remove league-element__control league-element__control--primary">
																		<input class="13-box" type="checkbox" name="boxes" value="check_13" <c:if test="${isPlaying eq 'Y'}">checked</c:if> onclick="activatePlayer('${sessionScope.userId}','${gameClubPlayerId}',this);" />
																	</div>
																	<%-- <div class="leaguejs-info league-element__control league-element__control--info">
																		<a href="javascript:void(0);" title="View player information" class="fa fa-info" onclick="showPlayerDetails('${gameClubPlayerId}');"></a>
																	</div> --%>
																</div>
															</div>

														</div>
													</div>
												</div>
												<div id="leaguer-pos14" class="league-pitch__unit league-pitch__unit--3">
													<div class="league-transfer--original">
													<s:sport position="2" playerType="ar"/>
														<div class="league-element" tabindex="0">
															<div class="leaguejs-menu check_14">
															<c:if test="${not empty clubId and clubId ne ''}">
																<spring:message code="club_${clubId}_image" var="imageSrc" />
															</c:if>		
																<picture>
																	<img src="/SportMgmt/images/ar_${imageSrc}"  alt="Middlesbrough" title="Middlesbrough" class="league-shirt league-element__shirt">
																</picture>
																<div class="league-element__name">${playerName}</div>
																<div class="league-element__data">${price}</div>
																<div class="league-element__controls">
																	<div class="leaguejs-remove league-element__control league-element__control--primary">
																		<input class="14-box" type="checkbox" name="boxes" value="check_14" <c:if test="${isPlaying eq 'Y'}">checked</c:if> onclick="activatePlayer('${sessionScope.userId}','${gameClubPlayerId}',this);" />
																	</div>
																	<%-- <div class="leaguejs-info league-element__control league-element__control--info">
																		<a href="javascript:void(0);" title="View player information" class="fa fa-info" onclick="showPlayerDetails('${gameClubPlayerId}');"></a>
																	</div> --%>
																</div>
															</div>

														</div>
													</div>
												</div>
												<div id="leaguer-pos15" class="league-pitch__unit league-pitch__unit--3">
													<div class="league-transfer--original">
													<s:sport position="3" playerType="ar"/>
														<div class="league-element" tabindex="0">
														<c:if test="${not empty clubId and clubId ne ''}">
																<spring:message code="club_${clubId}_image" var="imageSrc" />
															</c:if>		
															<div class="leaguejs-menu check_15">
																<picture>
																	<img src="/SportMgmt/images/ar_${imageSrc}"  alt="Man City" title="Man City" class="league-shirt league-element__shirt">
																</picture>
																<div class="league-element__name">${playerName}</div>
																<div class="league-element__data">${price}</div>
																<div class="league-element__controls">
																	<div class="leaguejs-remove league-element__control league-element__control--primary">
																		<input class="15-box" type="checkbox" name="boxes" value="check_15" <c:if test="${isPlaying eq 'Y'}">checked</c:if> onclick="activatePlayer('${sessionScope.userId}','${gameClubPlayerId}',this);"/>
																	</div>
																	<%-- <div class="leaguejs-info league-element__control league-element__control--info">
																		<a href="javascript:void(0);" title="View player information" class="fa fa-info" onclick="showPlayerDetails('${gameClubPlayerId}');"></a>
																	</div> --%>
																</div>
															</div>

														</div>
													</div>
												</div>
											</div>
											
											<div class="league-element-row league-element-row--pitch">
												<div id="leaguer-pos8" class="league-pitch__unit league-pitch__unit--5">
													<div class="league-transfer--original">
													<s:sport position="1" playerType="bowl"/>
														<div class="league-element" tabindex="0">
															<div class="leaguejs-menu check_8">
															<c:if test="${not empty clubId and clubId ne ''}">
																<spring:message code="club_${clubId}_image" var="imageSrc" />
															</c:if>		
																<picture>
																	<img src="/SportMgmt/images/bowl_${imageSrc}"  alt="Liverpool" title="Liverpool" class="league-shirt league-element__shirt">
																</picture>
																<div class="league-element__name">${playerName}</div>
																<div class="league-element__data">${price}</div>
																<div class="league-element__controls">
																	<div class="leaguejs-remove league-element__control league-element__control--primary">
																		<input class="8-box" type="checkbox" name="boxes" value="check_8" /<c:if test="${isPlaying eq 'Y'}">checked</c:if> onclick="activatePlayer('${sessionScope.userId}','${gameClubPlayerId}',this);">
																	</div>
																	<%-- <div class="leaguejs-info league-element__control league-element__control--info">
																		<a href="javascript:void(0);" title="View player information" class="fa fa-info" onclick="showPlayerDetails('${gameClubPlayerId}');"></a>
																	</div> --%>
																</div>
															</div>

														</div>
													</div>
												</div>
												<div id="leaguer-pos9" class="league-pitch__unit league-pitch__unit--5">
													<div class="league-transfer--original">
													<s:sport position="2" playerType="bowl"/>
														<div class="league-element" tabindex="0">
															<div class="leaguejs-menu check_9">
															<c:if test="${not empty clubId and clubId ne ''}">
																<spring:message code="club_${clubId}_image" var="imageSrc" />
															</c:if>		
																<picture>
																	<img src="/SportMgmt/images/bowl_${imageSrc}"  alt="Everton" title="Everton" class="league-shirt league-element__shirt">
																</picture>
																<div class="league-element__name">${playerName}</div>
																<div class="league-element__data">${price}</div>
																<div class="league-element__controls">
																	<div class="leaguejs-remove league-element__control league-element__control--primary">
																		<input class="9-box" type="checkbox" name="boxes" value="check_9" <c:if test="${isPlaying eq 'Y'}">checked</c:if> onclick="activatePlayer('${sessionScope.userId}','${gameClubPlayerId}',this);"/>
																	</div>
																	<%-- <div class="leaguejs-info league-element__control league-element__control--info">
																		<a href="#" title="View player information" class="fa fa-info" onclick="showPlayerDetails('${gameClubPlayerId}');"
																		></a>
																	</div> --%>
																</div>
															</div>

														</div>
													</div>
												</div>
												<div id="leaguer-pos10" class="league-pitch__unit league-pitch__unit--5">
													<div class="league-transfer--original">
													<s:sport position="3" playerType="bowl"/>
														<div class="league-element" tabindex="0">
															<div class="leaguejs-menu check_10">
															<c:if test="${not empty clubId and clubId ne ''}">
																<spring:message code="club_${clubId}_image" var="imageSrc" />
															</c:if>		
																<picture>
																	<img src="/SportMgmt/images/bowl_${imageSrc}"  alt="Chelsea" title="Chelsea" class="league-shirt league-element__shirt">
																</picture>
																<div class="league-element__name">${playerName}</div>
																<div class="league-element__data">${price}</div>
																<div class="league-element__controls">
																	<div class="leaguejs-remove league-element__control league-element__control--primary">
																		<input class="10-box" type="checkbox" name="boxes" value="check_10" <c:if test="${isPlaying eq 'Y'}">checked</c:if> onclick="activatePlayer('${sessionScope.userId}','${gameClubPlayerId}',this);"/>
																	</div>
																	<%-- <div class="leaguejs-info league-element__control league-element__control--info">
																		<a href="javascript:void(0);" title="View player information" class="fa fa-info" onclick="showPlayerDetails('${gameClubPlayerId}');"
																		></a>
																	</div> --%>
																</div>
															</div>

														</div>
													</div>
												</div>
												<div id="leaguer-pos11" class="league-pitch__unit league-pitch__unit--5">
													<div class="league-transfer--original">
													<s:sport position="4" playerType="bowl"/>
														<div class="league-element" tabindex="0">
															<div class="leaguejs-menu check_11">
															<c:if test="${not empty clubId and clubId ne ''}">
																<spring:message code="club_${clubId}_image" var="imageSrc" />
															</c:if>		
																<picture>
																	<img src="/SportMgmt/images/bowl_${imageSrc}"  alt="Swanca" title="Swanca" class="league-shirt league-element__shirt">
																</picture>
																<div class="league-element__name">${playerName}</div>
																<div class="league-element__data">${price}</div>
																<div class="league-element__controls">
																	<div class="leaguejs-remove league-element__control league-element__control--primary">
																		<input class="11-box" type="checkbox" name="boxes" value="check_11" <c:if test="${isPlaying eq 'Y'}">checked</c:if> onclick="activatePlayer('${sessionScope.userId}','${gameClubPlayerId}',this);"/>
																	</div>
																	<%-- <div class="leaguejs-info league-element__control league-element__control--info">
																		<a href="javascript:void(0);" title="View player information" class="fa fa-info" onclick="showPlayerDetails('${gameClubPlayerId}');"></a>
																	</div> --%>
																</div>
															</div>

														</div>
													</div>
												</div>
												<div id="leaguer-pos12" class="league-pitch__unit league-pitch__unit--5">
													<div class="league-transfer--original">
														<div class="league-element" tabindex="0">
														<s:sport position="5" playerType="bowl"/>
															<div class="leaguejs-menu check_12">
															<c:if test="${not empty clubId and clubId ne ''}">
																<spring:message code="club_${clubId}_image" var="imageSrc" />
															</c:if>		
																<picture>
																	<img src="/SportMgmt/images/bowl_${imageSrc}"  alt="Man Utd" title="Man Utd" class="league-shirt league-element__shirt">
																</picture>
																<div class="league-element__name">${playerName}</div>
																<div class="league-element__data">${price}</div>
																<div class="league-element__controls">
																	<div class="leaguejs-remove league-element__control league-element__control--primary">
																		<input class="12-box" type="checkbox" name="boxes" value="check_12" <c:if test="${isPlaying eq 'Y'}">checked</c:if> onclick="activatePlayer('${sessionScope.userId}','${gameClubPlayerId}',this);">
																	</div>
																	<%-- <div class="leaguejs-info league-element__control league-element__control--info" >
																		<a href="javascript:void(0);" title="View player information" class="fa fa-info" onclick="showPlayerDetails('${gameClubPlayerId}');"></a>
																	</div> --%>
																</div>
																</div>
															</div>

														</div>
													</div>
												</div>
											</div>

											

										</div>
									</section>
							   </div>
							</div>
						</section>   
					</div>

                <!-- Secondary content -->
                <div id="leaguer-side" class="league-sidebar">
					<div>
						<section>
							<h2 class="subHeader league-sub-header">${sessionScope.user.displayName}</h2>

							<div class="league-bordered league-bordered--primary">

								<!-- ENTRY BAR -->
								<div class="league-entry-bar">
									<div class="league-media league-media--centred league-media--reversed">
										<div class="league-media__figure">
											${sessionScope.user.country}
										</div>
										<div class="league-media__body">
											<div class="league-entry-bar__name"></div>
										</div>
									</div>
								</div>


								<!-- POINTS / RANKINGS -->
								<div class="league-panel league-panel--guttered">
									<h3 class="league-panel__heading">Points/Rankings</h3>
									<div class="league-panel__body">

										<ul class="league-data-list league-data-list--bordered">
											<li class="league-data-list__item">
												<h3 class="league-data-list__item__heading">Overall Points:</h3>
												<div class="league-data-list__item__value">${sessionScope.user.userGameMap.point}</div>
											</li>
											<li class="league-data-list__item">
												<h3 class="league-data-list__item__heading">Overall Rank:</h3>
												<div class="league-data-list__item__value">${sessionScope.user.userGameMap.rank}</div>
											</li>
											<li class="league-data-list__item">
												<h3 class="league-data-list__item__heading">Total Players:</h3>
												<div class="league-data-list__item__value">${fn:length(sessionScope.playerList)}</div>
											</li>
											<li class="league-data-list__item">
												<h3 class="league-data-list__item__heading">Gameweek Points:</h3>
												<div class="league-data-list__item__value">
													
												</div>
											</li>
										</ul>
									</div>
									
								</div>

								<!-- LEAGUES -->
								<div class="league-panel choose_capt">
								<h3 class="league-panel__heading">Choose Captain/Vice-Captain</h3>
									<div class="league-panel__body">
										<form action="#">
											<div class="form_row">
											   <!--  <input list="choose_cap" name="choose_captain" placeholder="Choose Captain" class="inp-control">
											    <datalist id="choose_cap">
												    <option value="Ospina">
												    <option value="Chambers">
												    <option value="Jenkinson">
												    <option value="Coquelin">
											    </datalist> -->
											    <select id="captain-select">
											    </select>
										    </div>
										    
										    <div class="form_row">
											    <!-- <input list="choose_wisecap" name="choose_wisecaptain" placeholder="Choose Vice Captain" class="inp-control">
											    <datalist id="choose_wisecap">
												    <option value="Ospina">
												    <option value="Chambers">
												    <option value="Jenkinson">
												    <option value="Coquelin">
											    </datalist> -->
											    <select id="vice-captain-select"></select>
										    </div>
										    <input type="button" class="button btnSubmit" value="Save" onclick="updateCaptain('${sessionScope.user.userId}');">
										</form>
									</div>
								</div>
							</div>
						</div>
				<%-- <div class="league-panel__footer league-panel__footer--guttered">
					<a href="#" class="leaguejs-link btn btn-secondary league-button league-button--full">Create and join leagues<span class="fa fa-caret-right"></span></a>
				</div>
				<div class="league-panel league-panel--dark">
                    <h3 class="league-panel__heading league-panel__heading--guttered">Cup</h3>
                    
                        <div class="league-panel__body league-panel--dark__body">
                            <p>The cup will start in Gameweek 18.</p>
                        </div>
                    
                    <div class="league-panel__footer league-panel__footer--guttered">
                        <a href="#" class="leaguejs-link league-link league-link--more">View cup history<span class="fa fa-angle-double-right"></span></a>
                    </div>
                </div> --%>
							</div>
						</section>
						<div id="leaguer-elements-menu"></div>
					</div>
				</div>
			</div>
		</div>		
	</main>

 
<script type="text/javascript">
   var gameDetailsJson = null;
   var playerListJson = null;
   var clubListJson = null;
   var userGameJson = null;
   var totalPlayingJson = null;
   </script>
   	<c:if test="${not empty sessionScope.gameDetailsJson}">
   	<script type="text/javascript">
   		gameDetailsJson = ${sessionScope.gameDetailsJson};
   	</script>
   	</c:if>
   	<c:if test="${not empty sessionScope.playerListJson}">
   		<script type="text/javascript">
  		 playerListJson = ${sessionScope.playerListJson};
  		</script>
	</c:if>
  	<c:if test="${not empty sessionScope.userGameJson}">
  	<script type="text/javascript">
  		userGameJson = ${sessionScope.userGameJson};
		</script>
	</c:if>
	<c:if test="${not empty sessionScope.clubListJson}">
  	<script type="text/javascript">
		clubListJson = ${sessionScope.clubListJson};
		</script>
	</c:if>
	<c:if test="${not empty totalPlayingJson}">
  	<script type="text/javascript">
  		totalPlayingJson = ${totalPlayingJson};
		</script>
	</c:if>
<script type="text/javascript">
	$(window).load(function(){
	ToggleShow('.1-box', '.check_1'); ToggleShow('.2-box', '.check_2');
	ToggleShow('.3-box', '.check_3');
	ToggleShow('.4-box', '.check_4');
	ToggleShow('.5-box', '.check_5');
	ToggleShow('.6-box', '.check_6');
	ToggleShow('.7-box', '.check_7');
	ToggleShow('.8-box', '.check_8');
	ToggleShow('.9-box', '.check_9');
	ToggleShow('.10-box', '.check_10');
	ToggleShow('.11-box', '.check_11');
	ToggleShow('.12-box', '.check_12');
	ToggleShow('.13-box', '.check_13');
	ToggleShow('.14-box', '.check_14');
	ToggleShow('.15-box', '.check_15');
	ToggleShow('.16-box', '.check_16');

	function ToggleShow(checkbox, div) {
		$(checkbox).change(function () {
			$(div).toggleClass('enable');
		});
	}
	});
	var playerLimits =  {"minCheckLegth":7,"min":{'Goalkeeper':1,"Defender":3,"Midfielder":3,"Forward":1},"max":{'Goalkeeper':1,"Defender":5,"Midfielder":5,"Forward":3},"total":11}
	function activatePlayer(userId,gameClubPlayerId,checkBox)
	{
		if(typeof userId !='undefined' && typeof gameClubPlayerId !='undefined' &&  typeof checkBox != 'undefined')
		{
			var url="";
			var playerType = "";
			if(checkBox.checked)
			{
				for(var i=0;i<playerListJson.length;i++)
				{
					if(playerListJson[i].gameClubPlayerId == gameClubPlayerId)
					{
						playerType = playerListJson[i].type;
						//document.getElementById("leaguer-pos" +i).className ="enable";
					}
					
				}
				console.log("player Type: "+playerType);
				console.log("total Player: "+totalPlayingJson["player"]+" , player total limit: "+playerLimits["total"]);
				if(totalPlayingJson["player"] >= playerLimits["total"])
				{
					alert("You can't select more than 11 Players");
					checkBox.checked = false;
					return;
				}
				console.log("total Player of your type:  "+totalPlayingJson[playerType]+" , maximum limit of your type: "+playerLimits["max"][playerType]);
				if(totalPlayingJson[playerType] >= playerLimits["max"][playerType])
				{
					alert(playerType+" Maximum limit is " +playerLimits['max'][playerType]);
					checkBox.checked = false;
					return;
				}
				var leftMinPlayers = 0;
				if(totalPlayingJson["Goalkeeper"] < playerLimits["min"]["Goalkeeper"])
				{
					leftMinPlayers += playerLimits["min"]["Goalkeeper"] - totalPlayingJson["Goalkeeper"];
				}
				if(totalPlayingJson["Defender"] < playerLimits["min"]["Defender"])
				{
					leftMinPlayers += playerLimits["min"]["Defender"] - totalPlayingJson["Defender"];
				}
				if(totalPlayingJson["Midfielder"] < playerLimits["min"]["Midfielder"])
				{
					leftMinPlayers += playerLimits["min"]["Midfielder"] - totalPlayingJson["Midfielder"];
				}
				if(totalPlayingJson["Forward"] < playerLimits["min"]["Forward"])
				{
					leftMinPlayers += playerLimits["min"]["Forward"] - totalPlayingJson["Forward"];
				}
				var leftTotalPlayer = playerLimits["total"]-totalPlayingJson["player"];
				console.log("<-------- Left total Player: "+leftTotalPlayer+",  leftMinPlayers: "+leftMinPlayers);
				if(leftTotalPlayer <= leftMinPlayers)
				{
					if(totalPlayingJson[playerType] >= playerLimits["min"][playerType])
					{
						alert("Select minimum "+playerLimits["min"]["Goalkeeper"]+" Goalkeeper, "+playerLimits["min"]["Midfielder"]+" Midfielder, "+playerLimits["min"]["Defender"]+" Defender, "+playerLimits["min"]["Forward"]+" Forward");
						checkBox.checked = false;
						return;

					}	
				}					
				url ="/SportMgmt/mvc/game/ActivatePlayer?userId="+userId+"&gameClubPlayerId="+gameClubPlayerId;
				$.ajax({
		     		  url: url,
		     		  dataType: 'json',
		     		  success: function( resp ) {
		     			  if(resp.isSuccess)
		     			  {
		     				 if(typeof resp.userGameJson != 'undefined')
		     				  userGameJson = resp.userGameJson;
		     				 if(typeof resp.totalPlayingJson != 'undefined')
		     					totalPlayingJson = resp.totalPlayingJson;
		     				updatePlayerList();
		     			  }
		     			  else
		    			  {
		    				  	alert(resp.errorMessage);
		    			  }
		     		  },
		     		  error: function( req, status, err ) {
		     		    console.log( 'something went wrong', status, err );
		     		  }
		     		});
			}
			else
			{
				url ="/SportMgmt/mvc/game/DeActivatePlayer?userId="+userId+"&gameClubPlayerId="+gameClubPlayerId;
				$.ajax({
		     		  url: url,
		     		  dataType: 'json',
		     		  success: function( resp ) {
		     			  if(resp.isSuccess)
		     			  {
		     				 if(typeof resp.userGameJson != 'undefined')
			     				  userGameJson = resp.userGameJson;
			     			  if(typeof resp.totalPlayingJson != 'undefined')
			     				totalPlayingJson = resp.totalPlayingJson;
			     			  updatePlayerList();
		     			  }
		     			  else
		    			  {
		    				  	alert(resp.errorMessage);
		    			  }
		     		  },
		     		  error: function( req, status, err ) {
		     		    console.log( 'something went wrong', status, err );
		     		  }
		     		});

			}
		}
	}
	$(document).ajaxStart(function(){
 		$("#ajaxloader").css("display", "block");
 		$('.mask').show();
 	});

 	$(document).ajaxComplete(function(){
 	    $("#ajaxloader").css("display", "none");
 	    $('.mask').hide();
 	});
 	function updatePlayerList()
 	{
 		if(typeof userGameJson !='undefined')
 		{
 			var activePlayerHtml = '<option value="0">Select Captain</option>';
 			var activePlayerHtml1 = '<option value="0">Select Vice Captain</option>';
 			var selectedCaptain = $('#captain-select option:selected').val();
 			var selectedViceCaptain = $('#vice-captain-select option:selected').val();
 			console.log('selectedCaptain: '+selectedCaptain+" , selectedViceCaptain: "+selectedViceCaptain);
 			for(var i=0;i<userGameJson.playerList.length;i++)
 			{
 				
 				if(userGameJson.playerList[i].isPlaying == 'Y')
 				{
 					var gameClubPlayerId = userGameJson.playerList[i].gameClubPlayerId;
 					//console.log("i: "+i+" , gameClubPlayerId: "+userGameJson.playerList[i].gameClubPlayerId);
 					var playerName='';
 					for(var j=0;j<playerListJson.length;j++)
 					{
 						if(playerListJson[j].gameClubPlayerId == gameClubPlayerId)
 						{
 							playerName = playerListJson[j].name;
 						}
 						
 					}
 					if(typeof selectedCaptain == 'undefined' && userGameJson.playerList[i].playerCategory == 'C')
 					{
 						selectedCaptain = gameClubPlayerId;
 					}
 					if(typeof selectedViceCaptain == 'undefined' && userGameJson.playerList[i].playerCategory == 'V')
 					{
 						selectedViceCaptain = gameClubPlayerId;
 					}
 					//console.log("playerName: "+playerName);
 					if(gameClubPlayerId == selectedCaptain)
 					activePlayerHtml +='<option value="'+gameClubPlayerId+'" selected>'+playerName+'</option>';
 					else
 					activePlayerHtml +='<option value="'+gameClubPlayerId+'">'+playerName+'</option>';
 					
 					if(gameClubPlayerId == selectedViceCaptain)
 	 				activePlayerHtml1 +='<option value="'+gameClubPlayerId+'" selected>'+playerName+'</option>';
 	 				else
 	 				activePlayerHtml1 +='<option value="'+gameClubPlayerId+'">'+playerName+'</option>';
 				}
 			}
 			console.log("activePlayerHtml: "+activePlayerHtml);
 			$('#captain-select').html(activePlayerHtml);
 			$('#vice-captain-select').html(activePlayerHtml1);
 		}
 	}
 	function updateCaptain(userId)
 	{
 		var selectedCaptain = $('#captain-select option:selected').val();
 		var selectedViceCaptain = $('#vice-captain-select option:selected').val();
 		if(typeof selectedCaptain != 'undefined' && selectedCaptain !=0)
 		{
 			url ="/SportMgmt/mvc/game/MakeCaptain?userId="+userId+"&gameClubPlayerId="+selectedCaptain;
 			$.ajax({
 	     		  url: url,
 	     		  dataType: 'json',
 	     		  async: false,
 	     		  success: function( resp ) {
 	     			  if(resp.isSuccess)
 	     			  {
 	     				 if(typeof resp.userGameJson != 'undefined')
 	     				  userGameJson = resp.userGameJson;
 	     				 if(typeof resp.totalPlayingJson != 'undefined')
 	     					totalPlayingJson = resp.totalPlayingJson;
 	     				//updatePlayerList();
 	     			  }
 	     			  else
 	    			  {
 	    				  	alert(resp.errorMessage);
 	    			  }
 	     		  },
 	     		  error: function( req, status, err ) {
 	     		    console.log( 'something went wrong', status, err );
 	     		  }
 	     		})
 		}
 		if(typeof selectedViceCaptain != 'undefined' && selectedViceCaptain !=0)
 		{
 			url ="/SportMgmt/mvc/game/MakeViceCaptain?userId="+userId+"&gameClubPlayerId="+selectedViceCaptain;
 			$.ajax({
 	     		  url: url,
 	     		  dataType: 'json',
 	     		  async: false,
 	     		  success: function( resp ) {
 	     			  if(resp.isSuccess)
 	     			  {
 	     				 if(typeof resp.userGameJson != 'undefined')
 	     				  userGameJson = resp.userGameJson;
 	     				 if(typeof resp.totalPlayingJson != 'undefined')
 	     					totalPlayingJson = resp.totalPlayingJson;
 	     				//updatePlayerList();
 	     			  }
 	     			  else
 	    			  {
 	    				  	alert(resp.errorMessage);
 	    			  }
 	     		  },
 	     		  error: function( req, status, err ) {
 	     		    console.log( 'something went wrong', status, err );
 	     		  }
 	     		})
 		}
 	}
 	$(document).ready(function(){
 		updatePlayerList();
 	});
</script>


