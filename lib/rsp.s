.include "macros.inc"
.set UCODE_SIZE, 0x800

.section .text

.balign 16
glabel rspbootTextStart
    .incbin "rsp/rspboot.bin"
.balign 16
glabel rspbootTextEnd

.balign 16
.ifndef F3DEX_GBI_SHARED
glabel gspFast3D_fifoTextStart /* Use regular Fast3D bins (default) */
    .incbin "rsp/fast3d.bin"
glabel gspFast3D_fifoTextEnd

.else /* Use one of the Fast3DEX series grucodes. */
    .ifndef F3DZEX_GBI_2
    .if F3DEX_GBI_2 == 1
    glabel gspF3DEX2_fifoTextStart
        .incbin "lib/PR/f3dex2/F3DEX2.bin"
    glabel gspF3DEX2_fifoTextEnd
    .elseif F3DEX_GBI == 1
    glabel gspF3DEX_fifoTextStart
        .incbin "lib/PR/f3dex/F3DEX.bin"
    glabel gspF3DEX_fifoTextEnd
    .endif
    .else /* Fast3DZEX */
    glabel gspF3DZEX2_fifoTextStart
        .incbin "lib/PR/f3dex2/F3DZEX.bin"
    glabel gspF3DZEX2_fifoTextEnd
    .endif
.endif

/* Audio Bins */

.balign 16
glabel aspMainTextStart
    .incbin "rsp/audio.bin"
glabel aspMainTextEnd

/*
 * LESS COMMON MICROCODES
 * These are setup to be loaded by G_LOAD_UCODE
 */

/* Fast3DEX NoN Text */
.ifdef F3DEX_NON_GBI
glabel gspF3DEX_NoN_fifoTextStart
    .balign 16
    .incbin "lib/PR/f3dex/F3DEX_NoN.bin"
glabel gspF3DEX_NoN_fifoTextEnd
.endif

/* Fast3DLX Text */
.ifdef F3DLX_GBI
glabel gspF3DLX_fifoTextStart
    .incbin "lib/PR/f3dex/F3DLX.bin"
glabel gspF3DLX_fifoTextEnd
.endif

/* Fast3DLX NoN Text */
.ifdef F3DLX_NON_GBI
glabel gspF3DLX_NoN_fifoTextStart
    .balign 16
    .incbin "lib/PR/f3dex/F3DLX_NoN.bin"
glabel gspF3DLX_NoN_fifoTextEnd
.endif

/* Fast3DLX Rej Text */
.ifdef F3DLX_REJ_GBI
glabel gspF3DLX_Rej_fifoTextStart
    .balign 16
    .incbin "lib/PR/f3dex/F3DLX_Rej.bin"
glabel gspF3DLX_Rej_fifoTextEnd
.endif

/* Line3DEX Text */
.ifdef L3DEX_GBI
glabel gspL3DEX_fifoTextStart
    .balign 16
    .incbin "lib/PR/f3dex/L3DEX.bin"
glabel gspL3DEX_fifoTextEnd
.endif

/* S2DEX Text */
.ifdef S2DEX_GBI
glabel gspS2DEX_fifoTextStart
    .balign 16
    .incbin "lib/PR/s2dex/S2DEX.bin"
glabel gspS2DEX_fifoTextEnd
.endif

/* Fast3DEX2 series */

/* Fast3DEX2 NoN Text */
.ifdef F3DEX2_NON_GBI
.balign 16
glabel gspF3DEX2_NoN_fifoTextStart
    .incbin "lib/PR/f3dex2/F3DEX2_NoN.bin"
glabel gspF3DEX2_NoN_fifoTextEnd
.endif

/* Fast3DEX2 Rej Text */
.ifdef F3DEX2_REJ_GBI
.balign 16
glabel gspF3DEX2_Rej_fifoTextStart
    .incbin "lib/PR/f3dex2/F3DEX2_Rej.bin"
glabel gspF3DEX2_Rej_fifoTextEnd
.endif

/* Line3DEX2 Text */
.ifdef L3DEX2_GBI
.balign 16
glabel gspL3DEX2_fifoTextStart
    .incbin "lib/PR/f3dex2/L3DEX2.bin"
glabel gspL3DEX2_fifoTextEnd
.endif

/* S2DEX2 Text */
.ifdef S2DEX_GBI_2
.balign 16
glabel gspS2DEX2_fifoTextStart
    .incbin "lib/PR/s2dex/S2DEX2.bin"
glabel gspS2DEX2_fifoTextEnd
.endif

/* DATA SECTION START */

.section .rodata

.balign 16
.ifndef F3DEX_GBI_SHARED /* Use regular Fast3D data (default) */
glabel gspFast3D_fifoDataStart
    .incbin "rsp/fast3d_data.bin"
glabel gspFast3D_fifoDataEnd

.else /* Using one of the Fast3DEX series grucodes */
    .ifndef F3DZEX_GBI_2
    .if F3DEX_GBI_2 == 1
    glabel gspF3DEX2_fifoDataStart
        .incbin "lib/PR/f3dex2/F3DEX2_data.bin"
    glabel gspF3DEX2_fifoDataEnd
    .elseif F3DEX_GBI == 1
    glabel gspF3DEX_fifoDataStart
        .incbin "lib/PR/f3dex/F3DEX_data.bin"
    glabel gspF3DEX_fifoDataEnd
    .endif
    .else /* Fast3DZEX */
    glabel gspF3DZEX2_fifoDataStart
        .incbin "lib/PR/f3dex2/F3DZEX_data.bin"
    glabel gspF3DZEX2_fifoDataEnd
    .endif
.endif

/* Audio Data */

.balign 16
glabel aspMainDataStart
    .incbin "rsp/audio_data.bin"
glabel aspMainDataEnd

/* LESS COMMON MICROCODES */

/* Fast3DEX Series */

/* Fast3DEX NoN Data */
.ifdef F3DEX_NON_GBI
.balign 16
glabel gspF3DEX_NoN_fifoDataStart
    .incbin "lib/PR/f3dex/F3DEX_NoN_data.bin"
glabel gspF3DEX_NoN_fifoDataEnd
.endif

/* Fast3DLX Data */
.ifdef F3DLX_GBI
.balign 16
glabel gspF3DLX_fifoDataStart
    .incbin "lib/PR/f3dex/F3DLX_data.bin"
glabel gspF3DLX_fifoDataEnd
.endif

/* Fast3DLX NoN Data */
.ifdef F3DLX_NON_GBI
.balign 16
glabel gspF3DLX_NoN_fifoDataStart
    .incbin "lib/PR/f3dex/F3DLX_NoN_data.bin"
glabel gspF3DLX_NoN_fifoDataEnd
.endif

/* Fast3DLX Rej Data */
.ifdef F3DLX_REJ_GBI
.balign 16
glabel gspF3DLX_Rej_fifoDataStart
    .incbin "lib/PR/f3dex/F3DLX_Rej_data.bin"
glabel gspF3DLX_Rej_fifoDataEnd
.endif

/* Line3DEX Data */
.ifdef L3DEX_GBI
.balign 16
glabel gspL3DEX_fifoDataStart
    .incbin "lib/PR/f3dex/L3DEX_data.bin"
glabel gspL3DEX_fifoDataEnd
.endif

/* S2DEX Data */
.ifdef S2DEX_GBI
.balign 16
glabel gspS2DEX_fifoDataStart
    .incbin "lib/PR/s2dex/S2DEX_data.bin"
glabel gspS2DEX_fifoDataEnd
.endif

/* Fast3DEX2 Series */

/* Fast3DEX2 NoN Data */
.ifdef F3DEX2_NON_GBI
.balign 16
glabel gspF3DEX2_NoN_fifoDataStart
    .incbin "lib/PR/f3dex2/F3DEX2_NoN_data.bin"
glabel gspF3DEX2_NoN_fifoDataEnd
.endif

/* Fast3DEX2 Rej Data */
.ifdef F3DEX2_REJ_GBI
.balign 16
glabel gspF3DEX2_Rej_fifoDataStart
    .incbin "lib/PR/f3dex2/F3DEX2_Rej_data.bin"
glabel gspF3DEX2_Rej_fifoDataEnd
.endif

/* Line3DEX2 Data */
.ifdef L3DEX2_GBI
.balign 16
glabel gspL3DEX2_fifoDataStart
    .incbin "lib/PR/f3dex2/L3DEX2_data.bin"
glabel gspL3DEX2_fifoDataEnd
.endif

/* S2DEX2 Data */
.ifdef S2DEX_GBI_2
.balign 16
glabel gspS2DEX_fifoDataStart
    .incbin "lib/PR/s2dex/S2DEX2_data.bin"
glabel gspS2DEX_fifoDataEnd
.endif
