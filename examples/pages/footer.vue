<style lang="scss">
	@import '../Common/styles/base/vars';
	.footer {
		position: absolute;
		left: 0;
		right: 0;
		bottom: 0;
		background-color: #fff;
		.weui-cell {
			padding: 15px 20px;
			height: 110rem / $rem;
			box-sizing: border-box;
			@at-root {
				#{&}__hd {
					& > img {
						$size: 80rem / $rem;
						display: block;
						margin-right: 20rem / $rem;
						width: $size;
						height: $size;
					}
				}
				#{&}__bd {
					& > h3 {
						font-size: 17px;
					}
					& > p {
						margin-top: 12px;
						font-size: 14px;
						color: rgb(102, 102, 102);
					}
				}
			}
		}
	}
</style>
<template>
	<div class="footer">
		<div class="weui-cell">
			<div class="weui-cell__hd"><img src="./qcode.png" alt=""></div>
			<div class="weui-cell__bd">
				<h3>微信号：bookface</h3>
				<p>每天一小时，听波叔讲故事</p>
			</div>
		</div>
	</div>
</template>