
non-nestable type attributes:
- nullable
- readonly/read-write
- async (promise)

nestable type attributes:
- pointer

Is a nullable+T usable as a T? no (?). But T is usable as a nullable+T.
cannot put ?T in slot for T.
can put T in slot for ?T.

```
/ list {
  # fixed_size__r<in T> {
    ;
  }
  # fixed_size__w<T> {
    actions
  }
}


# rx<T+> {
  (write updated_val T)
}
* rx<t_base> accepts rx<t_derived>
* rx_base<t_base> accepts rx_derived<t_derived>

# tx<T-> {
  (read) T
}
* tx<base> accepts tx<derived>

# rxtx<T> {
  ;
}
```

