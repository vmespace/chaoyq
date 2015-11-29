		</div><!-- END container -->
	</main>

	<div class="hide">
<script type="text/tpl" data-template="500">
<div class="alert alert-danger">
	<strong>[[global:500.title]]</strong>
	<p>[[global:500.message]]</p>
	<p>{path}</p>
	<!-- IF error --><p>{error}</p><!-- ENDIF error -->

</div>
</script>
	</div>


	<div class="topic-search hidden">
		<div class="btn-group">
			<button type="button" class="btn btn-default count"></button>
			<button type="button" class="btn btn-default prev"><i class="fa fa-fw fa-angle-up"></i></button>
			<button type="button" class="btn btn-default next"><i class="fa fa-fw fa-angle-down"></i></button>
		</div>
	</div>
	<div component="toaster/tray" class="alert-window"></div>

	<script>
		require(['forum/footer']);
	</script>
</body>
</html>
