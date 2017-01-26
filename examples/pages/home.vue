<style lang="scss">
	@import '../Common/styles/base/vars';
	.home {
		width: 100%;
		.wrapper {
			padding: 30px 50rem / $rem;
			box-sizing: border-box;
		}
		.tit {
			$w: 275rem / $rem;
			$h: 170rem / $rem;
			margin-bottom: 30rem / $rem;
			width: $w;
			height: $h;
			background: url(titleBg.png) no-repeat;
			background-size: $w $h;
			text-indent: -9999em;
		}
		.btn {
			display: block;
			margin-bottom: 25rem / $rem;
			width: 100%;
			border: none;
		}
		.btns {
			& > input {
				padding: 10rem / $rem 0;
				height: 24rem / $rem;
				line-height: 1.41176471;
				border: 1px solid rgb(37, 135, 139);
				border-radius: 50px;
				text-align: center;
				box-shadow: 0 3px 6px 0 rgba(0, 0, 0, .1);
			}
			.generate {
				height: 44rem / $rem;
				background: url(generateBtn.png) no-repeat;
				background-size: 275rem / $rem 44rem / $rem;
				text-indent: -9999em;
			}
		}
		.pic {
			position: absolute;
			left: 50rem / $rem;
			right: 50rem / $rem;
			bottom: 110rem / $rem;
			height: 100rem / $rem;
			background: url(bottom-pic.png) no-repeat;
			background-size: contain;
		}
	}
	.canvas {
		@at-root {
			#{&}-container {
				position: relative;
				width: 720px;
				height: 960px;
				background-repeat: no-repeat;
				text-align: center;
			}
		}
	}
</style>
<template>
	<div class="container home">
		<div class="wrapper" :style="{width: viewportWidth, height: viewportHeight}">
			<h3 class="tit">我好像过了假日子</h3>
			<div class="btns">
				<input class="btn" type="text" placeholder="输入你或好友的名字" v-model="name" @blur="scrollTop" maxlength="5">
				<button class="btn generate" @click="jump()">生成故事</button>
			</div>
	    <div class="pic"></div>
	    <foot></foot>
		</div>
		<div class="canvas-container" ref="canvas" :style="{ backgroundImage: 'url(' + html.url + ')' }">
			<div class="canvas-text" v-html="html.content"></div>
		</div>
	</div>
</template>
<script>
	import { Toast } from 'mint-ui';
	import 'mint-ui/lib/toast/style.css';
	import foot from './footer.vue'
	import html2canvas from 'html2canvas'
	import store from '../vuex/store'
	import template from './template'
	export default {
		components: { foot },
		data(){
			return {
				name: '',
				url: ''
			}
		},
		methods: {
			jump(){
				const len = this.name.length
				if (!len) {
					Toast({
				    message: '输入框不能为空',
				    position: 'middle',
				    duration: 2000
					});
				} else if (len > 5) {
					Toast({
				    message: '最长只能输入5个字',
				    position: 'middle',
				    duration: 2000
					});
				} else {
					
					this.createCanvas()
				}
			},
			createCanvas(){
				const _this = this
				html2canvas(this.$refs.canvas, {
					onrendered: function (canvas){
						store.commit('base64', canvas.toDataURL('image/png'))
						_this.$router.push('product')
					},
					width: 720,
					height: 960
				})
			},
			scrollTop(){
				document.body.scrollTop = 0
			}
		},
		computed: {
      viewportWidth() {
        return `${window.screen.width}px`;
      },
      viewportHeight() {
        return `${window.screen.height}px`;
      },
			randomIntFromInterval(){
				if (this.$route.query && this.$route.query.page) {
					return this.$route.query.page - 1
				} else {
					return Math.floor(Math.random() * ((template.length - 1) - 0) + 0);
				}
			},
			html(){
				const tpl = template[this.randomIntFromInterval]
				console.log(this.randomIntFromInterval)
				let _result = {
					content: tpl.content.replace(/名字/g, this.name),
					url: require('../Common/images/' + tpl.url)
				}
				return _result
			}
		},
		mounted(){
			window.addEventListener('touchmove', (e) => {
				event.preventDefault()
			})
		}
	}
</script>