<script setup lang="ts">
import { computed } from 'vue'
import { IconSun, IconMoonStars } from '@tabler/icons-vue'
import { useThemeStore } from '@/stores/theme/useThemeStore'

interface DarkModeProps {
  isMobile: boolean
}

const props = defineProps<DarkModeProps>()

const themeStore = useThemeStore()
const isDark = computed(() => themeStore.theme)
const themeText = computed(() => (themeStore.theme === 'light' ? 'Modo oscuro' : 'Modo claro'))
const icon = computed(() => (themeStore.theme === 'light' ? IconMoonStars : IconSun))
</script>

<template>
  <button
    @click="themeStore.toggleTheme"
    class="flex items-center gap-2 py-2 rounded-xl transition-all duration-200 hover:bg-base-300 hover:text-base-content w-full"
    :class="props.isMobile ? 'px-2 justify-center' : 'px-4 justify-start'"
  >
    <!-- Icono -->
    <component :is="icon" class="h-6 w-6 transition-transform duration-300" />

    <!-- Texto con transición -->
    <Transition
      enter-active-class="transition-opacity duration-200 delay-100"
      leave-active-class="transition-opacity duration-200"
      enter-from-class="opacity-0"
      leave-to-class="opacity-0"
    >
      <span class="text-sm font-medium" v-if="!props.isMobile">
        {{ themeText }}
      </span>
    </Transition>
  </button>
</template>

<style scoped>
/* Transición opcional extra si quieres animación de escalado */
.fade-scale-enter-active,
.fade-scale-leave-active {
  transition: all 0.4s ease;
}
.fade-scale-enter-from {
  opacity: 0;
  transform: scale(0.7) rotate(-45deg);
}
.fade-scale-enter-to {
  opacity: 1;
  transform: scale(1) rotate(0deg);
}
.fade-scale-leave-to {
  opacity: 0;
  transform: scale(0.7) rotate(45deg);
}
</style>
