<script setup>
import Sidebar from '@/components/shared/sidebar/Sidebar.vue'
import { useSidebarStore } from '@/stores/sidebar/useSidebarStore'
const sidebar = useSidebarStore()
</script>

<template>
  <div class="min-h-screen bg-base-100 transition-colors duration-300 flex">
    <Sidebar />
    <main
      :class="[
        'flex-1 p-4 transition-all duration-300 ease-in-out',

        sidebar.isMobile ? 'ml-0 w-full' : sidebar.isExpanded ? 'lg:ml-72' : 'lg:ml-20',
      ]"
    >
      asdsadasdasdasdas
    </main>
  </div>
</template>
