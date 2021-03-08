{**
 * templates/frontend/pages/searchAuthorDetails.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Index of published articles by author.
 *
 *}
{strip}
	{assign var="pageTitle" value="search.authorDetails"}
	{include file="frontend/components/header.tpl"}
{/strip}

<main id="highlander_content_main">
	<section class="author-details__meta">
		<div class="container">
			<h1 class="author-details__title">
				{translate key="plugins.themes.highlander.author.details"}
			</h1>
			<h2 class="author-details__name">{$authorName|escape}
			</h2>
			{if $affiliation || $country}
			<p class="author-details__affiliation">
				{if $affiliation}{$affiliation|escape}{/if}{if $country && $affiliation}, {$country|escape}{elseif $country} {$country|escape}{/if}
			</p>
			{/if}
		</div>
	</section>

	<section class="author-details__articles">
		<div class="container">
			<div class="content-body">
				<div id="authorDetails">
					<ul class="author-details__list">
						{foreach from=$submissions item=article}
							{assign var=issueId value=$article->getCurrentPublication()->getData('issueId')}
							{assign var=issue value=$issues[$issueId]}
							{assign var=issueUnavailable value=$issuesUnavailable.$issueId}
							{assign var=sectionId value=$article->getCurrentPublication()->getData('sectionId')}
							{assign var=journalId value=$article->getData('contextId')}
							{assign var=journal value=$journals[$journalId]}
							{assign var=section value=$sections[$sectionId]}
							{if $issue->getPublished() && $section && $journal}
								<li>
									<article class="article">
										<div class="row">
											<div class="col-md-8">

												<h3 class="article__title">
													<a href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestId()}">
														{$article->getLocalizedFullTitle()|strip_unsafe_html}
													</a>
												</h3>

												<p class="author-details__section-title text-muted small">
													{$section->getLocalizedTitle()|escape}
												</p>

												{if (!$issueUnavailable || $article->getCurrentPublication()->getData('accessStatus') == $smarty.const.ARTICLE_ACCESS_OPEN)}
													<ul class="article__btn-group">
														{foreach from=$article->getGalleys() item=galley}
															<li>
																<a href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestId()|to_array:$galley->getBestGalleyId()}"
																   class="btn btn-secondary">{$galley->getGalleyLabel()|escape}</a>
															</li>
														{/foreach}
													</ul>
												{/if}
											</div>
										</div>
									</article>
								</li>
							{/if}
						{/foreach}
					</ul>
				</div>
			</div>
		</div>
	</section>
</main>
{include file="frontend/components/footer.tpl"}
