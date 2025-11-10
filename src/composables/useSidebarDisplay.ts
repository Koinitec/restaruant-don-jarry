import { computed } from 'vue'

interface SidebarDisplayProps {
  isExpanded: boolean
  isMobile: boolean
}

export function useSidebarDisplay(props: SidebarDisplayProps) {
  const showTooltip = computed(() => !props.isExpanded && !props.isMobile)
  const showLabel = computed(() => props.isExpanded || props.isMobile)

  return { showTooltip, showLabel }
}
