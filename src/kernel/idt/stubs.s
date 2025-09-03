use32
format elf

section '.text'

macro isr_err_stub id {
  public isr_stub_#id
  isr_stub_#id:
        cli
        hlt
}

macro isr_no_err_stub id {
  public isr_stub_#id
  isr_stub_#id:
        cli
        hlt
}

isr_no_err_stub 0
isr_no_err_stub 1
isr_no_err_stub 2
isr_no_err_stub 3
isr_no_err_stub 4
isr_no_err_stub 5
isr_no_err_stub 6
isr_no_err_stub 7
isr_err_stub    8
isr_no_err_stub 9
isr_err_stub    10
isr_err_stub    11
isr_err_stub    12
isr_err_stub    13
isr_err_stub    14
isr_no_err_stub 15
isr_no_err_stub 16
isr_err_stub    17
isr_no_err_stub 18
isr_no_err_stub 19
isr_no_err_stub 20
isr_no_err_stub 21
isr_no_err_stub 22
isr_no_err_stub 23
isr_no_err_stub 24
isr_no_err_stub 25
isr_no_err_stub 26
isr_no_err_stub 27
isr_no_err_stub 28
isr_no_err_stub 29
isr_err_stub    30
isr_no_err_stub 31

section '.rodata'

public isr_stub_table
isr_stub_table:
    dd \
        isr_stub_0,  isr_stub_1,  isr_stub_2,  isr_stub_3, \
        isr_stub_4,  isr_stub_5,  isr_stub_6,  isr_stub_7, \
        isr_stub_8,  isr_stub_9,  isr_stub_10, isr_stub_11, \
        isr_stub_12, isr_stub_13, isr_stub_14, isr_stub_15, \
        isr_stub_16, isr_stub_17, isr_stub_18, isr_stub_19, \
        isr_stub_20, isr_stub_21, isr_stub_22, isr_stub_23, \
        isr_stub_24, isr_stub_25, isr_stub_26, isr_stub_27, \
        isr_stub_28, isr_stub_29, isr_stub_30, isr_stub_31

section '.note.GNU-stack'