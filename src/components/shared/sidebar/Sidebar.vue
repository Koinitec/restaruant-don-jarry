<script setup lang="ts">
import { menuItems } from './data/sidebar.data'
import DarkMode from '@/components/shared/toggles/DarkMode.vue'
import { useSidebarStore } from '@/stores/sidebar/useSidebarStore'
import { IconMenu2, IconLogout, IconX } from '@tabler/icons-vue'
import { RouterLink, useRoute } from 'vue-router'

const sidebar = useSidebarStore()
const route = useRoute()

const handleNavClick = () => {
  if (sidebar.isMobile) sidebar.closeSidebar()
}
</script>

<template>
  <!-- BOTÓN MENÚ MÓVIL -->
  <button
    v-if="sidebar.isMobile"
    @click="sidebar.toggleSidebar"
    class="fixed top-4 left-4 z-50 p-3 bg-base-100/80 backdrop-blur-lg shadow-md rounded-2xl hover:bg-base-200 transition-colors"
    aria-label="Abrir/Cerrar menú"
  >
    <component :is="sidebar.isOpen ? IconX : IconMenu2" class="h-6 w-6 text-base-content" />
  </button>

  <!-- SIDEBAR -->
  <Transition
    enter-active-class="transition-transform duration-300"
    leave-active-class="transition-transform duration-300"
    enter-from-class="-translate-x-full"
    leave-to-class="-translate-x-full"
  >
    <aside
      v-if="sidebar.isOpen || !sidebar.isMobile"
      class="fixed top-0 left-0 h-screen flex flex-col bg-base-200/80 backdrop-blur-2xl border-r border-base-300/40 shadow-xl z-50 w-72"
    >
      <!-- HEADER -->
      <div
        class="flex items-center justify-between p-4 border-b border-base-300/40 min-h-[64px] relative"
      >
        <img
          v-if="!sidebar.isMobile"
          src=""
          alt="Logo"
          class="h-10 transition-opacity duration-200"
        />

        <button
          v-if="sidebar.isMobile"
          @click="sidebar.closeSidebar"
          class="absolute right-4 top-4 p-2 rounded-lg hover:bg-base-300 transition-colors"
          title="Cerrar menú"
        >
          <IconX class="h-5 w-5 text-base-content" />
        </button>
      </div>

      <!-- NAV -->
      <nav class="flex flex-col flex-1 px-3 py-4 space-y-1 overflow-y-auto">
        <template v-for="item in menuItems">
          <!-- Item con children -->
          <div
            v-if="item.children"
            :key="item.name"
            class="collapse collapse-arrow border-b border-base-300/40 rounded-lg"
          >
            <input type="checkbox" class="peer" />
            <div
              class="collapse-title flex items-center gap-3 px-4 py-3 cursor-pointer hover:bg-primary/90 hover:text-primary-content"
              :class="
                $route.path.startsWith(item.link)
                  ? 'bg-primary text-primary-content font-semibold'
                  : ''
              "
            >
              <component :is="item.icon" class="h-6 w-6" />
              <span class="text-sm font-medium whitespace-nowrap">{{ item.name }}</span>
            </div>
            <div class="collapse-content flex flex-col pl-8 pr-2 py-2 gap-1">
              <RouterLink
                v-for="child in item.children"
                :key="child.name"
                :to="child.link"
                @click="handleNavClick"
                class="flex items-center gap-3 px-2 py-2 rounded-lg transition-colors hover:bg-primary/80 hover:text-primary-content"
                :class="
                  $route.path === child.link ? 'bg-primary text-primary-content font-semibold' : ''
                "
              >
                <component :is="child.icon" class="h-5 w-5" />
                <span class="text-sm">{{ child.name }}</span>
              </RouterLink>
            </div>
          </div>

          <!-- Item simple -->
          <RouterLink
            v-else
            :to="item.link"
            @click="handleNavClick"
            :key="item.link"
            class="flex items-center gap-3 px-4 py-3 rounded-xl transition-all duration-200 hover:bg-primary/90 hover:text-primary-content relative"
            :class="
              $route.path === item.link ? 'bg-primary text-primary-content font-semibold' : ''
            "
          >
            <component :is="item.icon" class="h-6 w-6" />
            <span class="text-sm font-medium whitespace-nowrap">{{ item.name }}</span>
            <div
              v-if="$route.path === item.link"
              class="absolute left-0 top-0 h-full w-1 rounded-r-lg bg-primary"
            ></div>
          </RouterLink>
        </template>
      </nav>

      <!-- FOOTER -->
      <div class="flex flex-col p-4 border-t border-base-300/40 gap-3">
        <DarkMode :isMobile="sidebar.isMobile" />
        <RouterLink
          to="/logout"
          @click="handleNavClick"
          class="flex items-center gap-2 px-4 py-2 rounded-xl transition-all duration-200 hover:bg-error hover:text-error-content"
        >
          <IconLogout class="h-6 w-6" />
          <span class="text-sm font-medium">Cerrar sesión</span>
        </RouterLink>
      </div>
    </aside>
  </Transition>
</template>

<style scoped>
aside,
nav {
  overflow: visible !important;
}
</style>
