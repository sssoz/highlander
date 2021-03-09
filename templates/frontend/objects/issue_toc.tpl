{**
 * templates/frontend/objects/issue_toc.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a full table of contents.
 *
 * @uses $issue Issue The issue
 * @uses $issueTitle string Title of the issue. May be empty
 * @uses $issueSeries string Vol/No/Year string for the issue
 * @uses $issueGalleys array Galleys for the entire issue
 * @uses $hasAccess bool Can this user access galleys for this context?
 * @uses $publishedSubmissions array Lists of articles published in this issue
 *   sorted by section.
 * @uses $primaryGenreIds array List of file genre ids for primary file types
 * @uses $sectionHeading string Tag to use (h2, h3, etc) for section headings
 *}

<div class="container">
  <div class="row">
  	<header class="col-md-6 issue__header" data-aos="fade-up" data-aos-delay="50">
  		{if $requestedOp === "index"}
  			<p class="issue__meta">{translate key="journal.currentIssue"}</p>
  		{/if}
  		{strip}
  		{capture name="issueMetadata"}
  			{if $issue->getShowVolume() || $issue->getShowNumber()}
  				{if $issue->getShowVolume()}
  					<span class="issue__volume">{translate key="issue.volume"} {$issue->getVolume()|escape}{if $issue->getShowNumber()}, {/if}</span>
  				{/if}
  				{if $issue->getShowNumber()}
  					<span class="issue__number">{translate key="issue.no"} {$issue->getNumber()|escape}</span>
  				{/if}
  			{/if}
  			{if $issue->getShowTitle()}
  				<span class="issue__localized_name">{$issue->getLocalizedTitle()|escape}</span>
  			{/if}
  		{/capture}

  		{if $requestedPage === "issue" && $smarty.capture.issueMetadata|trim !== ""}
  			<h1 class="issue__title">
  				{$smarty.capture.issueMetadata}
  			</h1>
  		{elseif $smarty.capture.issueMetadata|trim !== ""}
  			<h2 class="issue__title">
              	{$smarty.capture.issueMetadata}
  			</h2>
  		{/if}

  		{if $issue->getDatePublished()}
  			<p class="issue__meta">{translate key="plugins.themes.highlander.issue.published"} {$issue->getDatePublished()|date_format:$dateFormatLong}</p>
  		{/if}
  		{/strip}
  	</header>

  	{if $issue->getLocalizedDescription() || $issueGalleys}
  		<section class="col-md-6 issue-desc" data-aos="fade-up" data-aos-delay="150">
  			{if $issue->getLocalizedDescription()}
        <h3 class="issue-desc__title">{translate key="plugins.themes.highlander.issue.description"}</h3>
        <div class="issue-desc__content">
          {assign var=stringLenght value=280}
          {assign var=issueDescription value=$issue->getLocalizedDescription()|strip_unsafe_html}
          {if $issueDescription|strlen <= $stringLenght || $requestedPage == 'issue'}
            {$issueDescription}
          {else}
            {$issueDescription|substr:0:$stringLenght|mb_convert_encoding:'UTF-8'|replace:'?':''|trim}
            <span class="ellipsis">...</span>
            <a class="full-issue__link"
               href="{url op="view" page="issue" path=$issue->getBestIssueId()}">{translate key="plugins.themes.highlander.issue.fullIssueLink"}</a>
          {/if}
        </div>
  			{/if}
  			{if $issueGalleys}
  			<div class="col-md-6">
  				{* Full-issue galleys *}
  				<div class="issue-desc__galleys">
  					<h3>
  						{translate key="issue.fullIssue"}
  					</h3>
  					<ul class="issue-desc__btn-group">
  						{foreach from=$issueGalleys item=galley}
  							<li>
  								{include file="frontend/objects/galley_link.tpl" parent=$issue purchaseFee=$currentJournal->getSetting('purchaseIssueFee') purchaseCurrency=$currentJournal->getSetting('currency')}
  							</li>
  						{/foreach}
  					</ul>
  				</div>
  			</div>
  			{/if}
  		</section>
  	{/if}
  </div>
</div>

{if $requestedPage === "index"}
  <div class="container-fluid" style="background-color: #FFF;">>
    <div class="row">
      <aside class="col-md-4 col-lg-3" style="padding-top: 7.5vh; padding-bottom: 7.5vh;" data-aos="fade-up">
        <a class="twitter-timeline" data-height="800" href="https://twitter.com/TheHighlanderJ?ref_src=twsrc%5Etfw">Tweets by TheHighlanderJ</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
      </aside>

      <div class="col-md-8 col-lg-9">
{/if}


      {foreach from=$publishedSubmissions item=section}
        {assign var='highlanderColorPick' value=$section.sectionColor|escape}
        <div style="background: {$highlanderColorPick};">
          <div class="container">
          	{if $section.articles}
          		<section class="issue-section">
                {if $section.title || $section.sectionDescription}
                  <header class="issue-section__header">
                    {if $section.title}
                      <h3 class="issue-section__title">{$section.title|escape}</h3>
                    {/if}
                    {if $section.sectionDescription}
                      <div class="issue-section__desc">
                        {$section.sectionDescription|strip_unsafe_html}
                      </div>
                    {/if}
                  </header>
                {/if}
                <ol class="issue-section__toc">
                  {foreach from=$section.articles item=article key=articleNumber}
                    <li class="issue-section__toc-item" data-aos="fade-up">
                      {include file="frontend/objects/article_summary.tpl"}
                    </li>
                  {/foreach}
                </ol>
          		</section>
          	{/if}
          </div>
        </div>
      {/foreach}
{if $requestedPage === "index"}
      </div>
    </div>
  </div>
{/if}
