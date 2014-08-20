create table Menu(
    menu_id int primary key,
    menu1 text,
	menu2 text,
	menu3 text,
	menu4 text,
	menu5 text
);

create or replace 
    function setmenu(p_menu_id int, p_menu1 text, p_menu2 text, p_menu3 text, p_menu4 text, p_menu5 text) 
    returns text as
$$
  declare
     v_menu_id int;
  begin
      select into v_menu_id menu from Menu 
         where menu_id = p_menu_id;
         
      if v_menu_id isnull then
          insert into Menu(menu_id, menu1, menu2, menu3, menu4, menu5) values
             (p_menu_id, p_menu1, p_menu2, p_menu3, p_menu4, p_menu5);
      else
          update Menu
          set menu1 = p_menu1,menu2 = p_menu2,menu3 = p_menu3 , menu4 = p_menu4, menu5 = p_menu5
          where menu_id = p_menu_id;
      end if;   
         
      return 'OK';
  end;
  $$
  language 'plpgsql';
  
  create or replace function 
    get_Menu_per_id(in int, out text, out text, out text, out text, out text) 
returns record as
$$ 
     select menu1, menu2, menu3, menu4, menu5 from Menu
     where menu_id = $1;
     
$$
 language 'sql';