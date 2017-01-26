<style lang="scss" scoped>
header {
  height: 80px;
  line-height: 80px;
  background-color: rgb(32, 160, 255);
}
.nav {
  float: right;
  & > li {
    float: left;
    margin-left: 10px;
  }
  a {
    display: block;
    padding: 0 20px;
    color: #fff;
    font-weight: bold;
    opacity: .8;
    &.active {
      position: relative;
      opacity: 1;
      &:after {
        position: absolute;
        left: 0;
        right: 0;
        bottom: 0;
        content: "";
        height: 4px;
        background-color: #99d2fc;
      }
    }
  }
}
</style>
<template>
  <header>
    <div class="wrapper">
      <ul class="nav">
        <li><router-link :to="{ name: 'home' }">所有主题</router-link></li>
        <li><router-link to="edit">创建主题</router-link></li>
      </ul>
    </div>
  </header>
</template>
