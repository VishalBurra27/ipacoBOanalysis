#include "template_patch.h"

mwifiex_set_wmm_params(struct mwifiex_private *priv,
		       struct mwifiex_uap_bss_param *bss_cfg,
		       struct cfg80211_ap_settings *params)
{
	const u8 *vendor_ie;
	const u8 *wmm_ie;
	u8 wmm_oui[] = {0x00, 0x50, 0xf2, 0x02};

	vendor_ie = cfg80211_find_vendor_ie(WLAN_OUI_MICROSOFT,
					    WLAN_OUI_TYPE_MICROSOFT_WMM,
					    params->beacon.tail,
 					    params->beacon.tail_len);
 	if (vendor_ie) {
 		wmm_ie = vendor_ie;
//fix_flaw_line_below:
//		if (*(wmm_ie + 1) > sizeof(struct mwifiex_types_wmm_info))
//fix_flaw_line_below:
//			return;
 		memcpy(&bss_cfg->wmm_info, wmm_ie +
 		       sizeof(struct ieee_types_header), *(wmm_ie + 1));
 		priv->wmm_enabled = 1;
	} else {
		memset(&bss_cfg->wmm_info, 0, sizeof(bss_cfg->wmm_info));
		memcpy(&bss_cfg->wmm_info.oui, wmm_oui, sizeof(wmm_oui));
		bss_cfg->wmm_info.subtype = MWIFIEX_WMM_SUBTYPE;
		bss_cfg->wmm_info.version = MWIFIEX_WMM_VERSION;
		priv->wmm_enabled = 0;
	}

	bss_cfg->qos_info = 0x00;
	return;
}
