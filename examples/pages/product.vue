<style lang="scss">
	@import '../Common/styles/base/vars';
	.product {
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
</style>
<template>
	<div class="container product">
		<div class="mask">
			<img :src="base64" alt="">
		</div>
		<div class="btns">
			<button @click="back()">重新生成</button>
			<button>保存图片</button>
		</div>
		<foot></foot>
	</div>
</template>
<script>
	import { mapGetters } from 'vuex'
	import foot from './footer.vue'
	export default {
		components: { foot },
		computed: {
			...mapGetters({
				url: 'getURL',
				base64: 'getBase64'
			})
		},
		methods: {
			back(){
				this.$router.push('/')
			}
		}
	}
</script>