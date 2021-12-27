<template>
  <div>
    <nav
      v-show="isNavBarVisible"
      class="
        top-0
        left-0
        right-0
        fixed
        flex
        bg-white
        h-14
        border-b border-gray-100
        z-30
        w-screen
        transition-position
        xl:pl-60
        lg:w-auto lg:items-stretch
        dark:bg-gray-900 dark:border-gray-800
      "
      :class="{ 'ml-60 lg:ml-0': isAsideMobileExpanded }"
    >
      <div class="flex-1 items-stretch flex h-14">
        <NavBarItem type="flex lg:hidden" @click.prevent="menuToggleMobile">
          <icon :path="menuToggleMobileIcon" size="24" />
        </NavBarItem>
        <NavBarItem type="hidden lg:flex xl:hidden" @click.prevent="menuOpenLg">
          <icon :path="mdiMenu" size="24" />
        </NavBarItem>
        <NavBarItem>
          <nav-bar-search />
        </NavBarItem>
      </div>
      <div class="flex-none items-stretch flex h-14 lg:hidden">
        <NavBarItem @click.prevent="menuNavBarToggle">
          <icon :path="menuNavBarToggleIcon" size="24" />
        </NavBarItem>
      </div>
      <div
        class="
          absolute
          w-screen
          top-14
          left-0
          bg-white
          shadow
          lg:w-auto
          lg:items-stretch
          lg:flex
          lg:grow
          lg:static
          lg:border-b-0
          lg:overflow-visible
          lg:shadow-none
          dark:bg-gray-900
        "
        :class="[isMenuNavBarActive ? 'block' : 'hidden']"
      >
        <div
          class="
            max-h-screen-menu
            overflow-y-auto
            lg:overflow-visible
            lg:flex
            lg:items-stretch
            lg:justify-end
            lg:ml-auto
          "
        >
          <nav-bar-menu has-divider>
            <NavBarItemLabel :icon="mdiMenu" label="Sample menu" />

            <template #dropdown>
              <NavBarItem>
                <NavBarItemLabel :icon="mdiClockOutline" label="Item One" />
              </NavBarItem>
              <NavBarItem>
                <NavBarItemLabel :icon="mdiCloud" label="Item Two" />
              </NavBarItem>
              <nav-bar-menu-divider />
              <NavBarItem>
                <NavBarItemLabel :icon="mdiCrop" label="Item Last" />
              </NavBarItem>
            </template>
          </nav-bar-menu>
          <nav-bar-menu has-divider>
            <user-avatar class="w-6 h-6 mr-3 inline-flex" />
            <div>
              <span>{{ userName }}</span>
            </div>

            <template #dropdown>
              <NavBarItem to="/profile">
                <NavBarItemLabel :icon="mdiAccount" label="My Profile" />
              </NavBarItem>
              <NavBarItem>
                <NavBarItemLabel :icon="mdiCogOutline" label="Settings" />
              </NavBarItem>
              <NavBarItem>
                <NavBarItemLabel :icon="mdiEmail" label="Messages" />
              </NavBarItem>
              <nav-bar-menu-divider />
              <NavBarItem>
                <NavBarItemLabel :icon="mdiLogout" label="Log Out" />
              </NavBarItem>
            </template>
          </nav-bar-menu>
          <NavBarItem
            has-divider
            is-desktop-icon-only
            @click.prevent="toggleLightDark"
          >
            <NavBarItemLabel
              :icon="mdiThemeLightDark"
              label="Light/Dark"
              is-desktop-icon-only
            />
          </NavBarItem>
          <NavBarItem
            href="https://github.com/justboil/admin-one-vue-tailwind"
            has-divider
            is-desktop-icon-only
          >
            <NavBarItemLabel
              :icon="mdiGithub"
              label="GitHub"
              is-desktop-icon-only
            />
          </NavBarItem>
          <NavBarItem is-desktop-icon-only>
            <NavBarItemLabel
              :icon="mdiLogout"
              label="Log out"
              is-desktop-icon-only
            />
          </NavBarItem>
        </div>
      </div>
    </nav>
  </div>
</template>
<script>
import NavBarItem from "./NavBarItem";
import NavBarItemLabel from "./NavBarItemLabel";
import NavBarMenu from "./NavBarMenu";
import NavBarMenuDivider from "./NavBarMenuDivider";
import UserAvatar from "./UserAvatar";
import Icon from "./Icon";
import NavBarSearch from "./NavBarSearch";
import {
  mdiForwardburger,
  mdiBackburger,
  mdiClose,
  mdiDotsVertical,
  mdiMenu,
  mdiClockOutline,
  mdiCloud,
  mdiCrop,
  mdiAccount,
  mdiCogOutline,
  mdiEmail,
  mdiLogout,
  mdiGithub,
  mdiThemeLightDark,
} from "@mdi/js";

export default {
  data() {
    return {
      isMenuNavBarActive: false,
      mdiMenu: mdiMenu,
      mdiClockOutline: mdiClockOutline,
      mdiCloud: mdiCloud,
      mdiCrop: mdiCrop,
      mdiAccount: mdiAccount,
      mdiCogOutline: mdiCogOutline,
      mdiEmail: mdiEmail,
      mdiLogout: mdiLogout,
      mdiGithub: mdiGithub,
      mdiThemeLightDark: mdiThemeLightDark,
    };
  },
  components: {
    NavBarItem,
    NavBarItemLabel,
    NavBarMenu,
    NavBarMenuDivider,
    UserAvatar,
    Icon,
    NavBarSearch,
  },
  method: {
    toggleLightDark() {
      this.$dashboard.state.dispatch("darkMode");
    },
    menuNavBarToggle() {
      this.isMenuNavBarActive.value = !this.isMenuNavBarActive.value;
    },
    menuOpenLg() {
      this.$dashboard.state.dispatch("asideLgToggle", true);
    },
  },
  computed: {
    isNavBarVisible() {
      return !this.$dashboard.state.isFullScreen;
    },
    isAsideMobileExpanded() {
      return this.$dashboard.state.isAsideMobileExpanded;
    },
    userName() {
      return this.$dashboard.state.userName;
    },
    menuToggleMobileIcon() {
      this.$dashboard.state.isAsideMobileExpanded.value
        ? mdiBackburger
        : mdiForwardburger;
    },
    menuToggleMobile() {
      this.$dashboard.state.dispatch("asideMobileToggle");
    },
    menuNavBarToggleIcon() {
      this.isMenuNavBarActive.value ? mdiClose : mdiDotsVertical;
    },
  },
};
</script>
