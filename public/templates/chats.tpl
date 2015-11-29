
<!-- IF breadcrumbs.length -->
<ol class="breadcrumb">
	<!-- BEGIN breadcrumbs -->
	<li<!-- IF @last --> component="breadcrumb/current"<!-- ENDIF @last --> itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb" <!-- IF @last -->class="active"<!-- ENDIF @last -->>
		<!-- IF !@last --><a href="{breadcrumbs.url}" itemprop="url"><!-- ENDIF !@last -->
			<span itemprop="title">
				{breadcrumbs.text}
				<!-- IF @last -->
				<!-- IF !feeds:disableRSS -->
				<!-- IF rssFeedUrl --><a target="_blank" href="{rssFeedUrl}"><i class="fa fa-rss-square"></i></a><!-- ENDIF rssFeedUrl --><!-- ENDIF !feeds:disableRSS -->
				<!-- ENDIF @last -->
			</span>
		<!-- IF !@last --></a><!-- ENDIF !@last -->
	</li>
	<!-- END breadcrumbs -->
</ol>
<!-- ENDIF breadcrumbs.length -->

<div class="row">
	<div class="col-md-4">
		<ul component="chat/recent" class="chats-list" data-nextstart="{nextStart}">
			<!-- BEGIN chats -->
			<li data-username="{../username}" data-uid="{../uid}" class="<!-- IF ../unread -->unread<!-- ENDIF ../unread -->">
				<!-- IF ../picture -->
				<img class="user-img" src="{../picture}">
				<!-- ELSE -->
				<div class="user-icon user-img" style="background-color: {../icon:bgColor};">{../icon:text}</div>
				<!-- ENDIF ../picture -->
				<i component="user/status" title="[[global:{../status}]]" class="fa fa-circle status {../status}"></i>
				<span class="username">{../username}</span>
				<span class="teaser-content">{../teaser.content}</span>
				<span class="teaser-timestamp timeago" title="{../teaser.timestampISO}"></span>
			</li>
			<!-- END chats -->
			<!-- BEGIN contacts -->
			<li data-username="{../username}" data-uid="{../uid}" class="<!-- IF ../unread -->unread<!-- ENDIF ../unread -->">
				<!-- IF ../picture -->
				<img class="user-img" src="{../picture}">
				<!-- ELSE -->
				<div class="user-icon user-img" style="background-color: {../icon:bgColor};">{../icon:text}</div>
				<!-- ENDIF ../picture -->
				<i component="user/status" title="[[global:{../status}]]" class="fa fa-circle status {../status}"></i>
				<span class="username">{../username}</span>
				<span class="teaser-content">{../teaser.content}</span>
				<span class="teaser-timestamp timeago" title="{../teaser.timestampISO}"></span>
			</li>
			<!-- END contacts -->
		</ul>
	</div>

	<div class="col-md-8 hidden-sm hidden-xs">
		<!-- IF !allowed -->
		<div class="alert alert-warning">
			[[error:chat-restricted]]
		</div>
		<!-- ENDIF !allowed -->
		<!-- IF meta -->
		<div component="chat/messages" class="expanded-chat" data-uid="{meta.uid}" data-username="{meta.username}">

			<button type="button" class="close" data-action="pop-out"><span aria-hidden="true"><i class="fa fa-compress"></i></span><span class="sr-only">[[modules:chat.pop-out]]</span></button>
			<h1 component="chat/title">{meta.username}</h1>


			<span class="since-bar"><a href="#" class="selected" data-since="recent">[[recent:title]]</a> &bull; <a href="#" data-since="week">[[modules:chat.seven_days]]</a> &bull; <a href="#" data-since="month">[[modules:chat.thirty_days]]</a> &bull; <a href="#" data-since="threemonths">[[modules:chat.three_months]]</a></span>
			<ul class="chat-content">
<!-- BEGIN messages -->
				<li class="chat-message clear" data-uid="{messages.fromuid}" data-self="{messages.self}" data-break="{messages.newSet}">
					<div class="message-header">
						<a href="{config.relative_path}/user/{messages.fromUser.userslug}">
							<!-- IF messages.fromUser.picture -->
							<img class="chat-user-image not-responsive" src="{messages.fromUser.picture}">
							<!-- ELSE -->
							<div class="user-icon chat-user-image" style="background-color: {messages.fromUser.icon:bgColor};">{messages.fromUser.icon:text}</div>
							<!-- ENDIF messages.fromUser.picture -->
						</a>
						<strong><span class="chat-user">{messages.fromUser.username}</span></strong>
						<span class="chat-timestamp timeago" title="{messages.timestampISO}"></span>
					</div>
					<div class="message-body">{messages.content}</div>
				</li>
<!-- END messages -->
			</ul>
			<div class="input-group">
				<textarea component="chat/input" placeholder="[[modules:chat.placeholder]]" class="form-control chat-input mousetrap" rows="1"></textarea>
				<span class="input-group-btn">
					<button class="btn btn-primary" type="button" data-action="send">[[modules:chat.send]]</button>
				</span>
			</div>
		</div>
		<!-- ELSE -->
		<div class="alert alert-info">
			[[modules:chat.no-messages]]
		</div>
		<!-- ENDIF meta -->
	</div>
</div>
