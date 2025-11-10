import { defineStore } from 'pinia'
import { ref, computed, onMounted, onUnmounted, nextTick } from 'vue'

export const useSidebarStore = defineStore('sidebar', () => {
  const isOpen = ref(false)
  const isExpanded = ref(localStorage.getItem('sidebar-expanded') === 'true')
  const isMobile = ref(window.innerWidth < 1024)

  const handleResize = () => {
    isMobile.value = window.innerWidth < 1024
  }

  onMounted(() => window.addEventListener('resize', handleResize))
  onUnmounted(() => window.removeEventListener('resize', handleResize))

  const toggleSidebar = () => (isOpen.value = !isOpen.value)
  const closeSidebar = () => (isOpen.value = false)
  const toggleExpand = () => {
    isExpanded.value = !isExpanded.value
    localStorage.setItem('sidebar-expanded', String(isExpanded.value))
  }

  return {
    isOpen,
    isExpanded,
    isMobile,
    toggleSidebar,
    closeSidebar,
    toggleExpand,
  }
})
