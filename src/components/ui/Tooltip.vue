<script setup lang="ts">
import { computed } from 'vue'

interface TooltipProps {
  text: string
  position?: 'top' | 'right' | 'bottom' | 'left'
  showDelay?: number
  hideDelay?: number
}

const props = defineProps<TooltipProps>()

const positionClasses = computed(() => {
  return {
    top: 'bottom-full left-1/2 -translate-x-1/2 mb-2',
    bottom: 'top-full left-1/2 -translate-x-1/2 mt-2',
    left: 'right-full top-1/2 -translate-y-1/2 mr-2',
    right: 'left-full top-1/2 -translate-y-1/2 ml-2',
  }
})
</script>

<template>
  <div class="relative group inline-block">
    <!-- Slot principal -->
    <slot />

    <!-- Tooltip -->
    <div
      class="absolute opacity-0 pointer-events-none group-hover:opacity-100 transition-opacity duration-200 z-50"
      :class="[positionClasses[position || 'top']]"
      :style="{ transitionDelay: `${showDelay || 150}ms` }"
    >
      <div
        class="bg-neutral text-neutral-content text-sm font-medium py-1.5 px-3 rounded-lg shadow-lg whitespace-nowrap"
      >
        {{ props.text }}
      </div>
    </div>
  </div>
</template>

<style scoped>
.group:hover > div {
  pointer-events: none;
}
</style>
