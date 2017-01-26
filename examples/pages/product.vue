<style lang="scss">
	@import '../Common/styles/base/vars';
	.product {
		position: absolute;
		left: 0;
		right: 0;
		top: 0;
		bottom: 0;
		padding: 30rem / $rem;
		box-sizing: border-box;
		.mask {
			height: 325rem / $rem;
			overflow: hidden;
			& > img {
				display: block;
				width: 100%;
			}
		}
		.btns {
			margin-top: 25rem / $rem;
			display: flex;
			align-items: center;
			& > button {
				flex: 1;
				height: 44px;
				border-radius: 50px;
				text-align: center;
				background-image: linear-gradient(to bottom, #fff, rgb(238, 238, 238));
				box-shadow: 0 6px 6px 0 rgba(17, 17, 17, .2);
				font-size: 16px;
				color: rgb(51, 51, 51);
				&:last-child {
					margin-left: 25rem / $rem;
				}
			}
		}
	}
	.toast {
		position: fixed;
		left: 0;
		top: 0;
		right: 0;
		bottom: 0;
		z-index: 11;
		@at-root {
			#{&}__mask {
				position: absolute;
				left: 0;
				top: 0;
				right: 0;
				bottom: 0;
				background-color: rgba(0, 0, 0, .5);

			}
			#{&}__content {
				position: absolute;
				left: 67px;
				right: 67px;
				top: 50%;
				padding: 40px 0;
				transform: translate(0, -50%);
				border-radius: 8px;
				font-size: 16px;
				line-height: 30px;
				background-color: #fff;
				text-align: center;
			}
		}
	}
</style>
<template>
	<div class="container product">
		<div class="mask">
			<img :src="base64" alt="">
		</div>
		<div class="btns">
			<button @click="back()">重新生成</button>
			<button @click="handleMask">保存图片</button>
		</div>
		<foot></foot>
		<div class="toast" @click="handleMask" v-show="show">
			<div class="toast__mask"></div>
			<div class="toast__content">在图片上长按即可保存<br />或发送给好友</div>
		</div>
	</div>
</template>
<script>
	import { mapGetters } from 'vuex'
	import foot from './footer.vue'
	export default {
		components: { foot },
		data(){
			return {
				show: false
			}
			
		},
		computed: {
			...mapGetters({
				url: 'getURL',
				base64: 'getBase64'
			})
		},
		methods: {
			back(){
				this.$router.push('/')
			},
			handleMask(){
				this.show = !this.show
			}
		}
	}
</script>