		xor esi, esi // azzero esi
		xor ecx, ecx // azzero ecx
		xor ebx, ebx // azzero ebx
		xor edi, edi // azzero edi
		xor edx, edx // azzero edx
		inc n

	cicloscorrimento :
		mov al, [vet + edi] // metto in al il numero

	ciclocontrollo :
		inc esi		// counter globale bit
		cmp esi, len        // controllo se ho finito
		ja termina
		test al, 1			// guardo se il bit meno significativo è a 1
		jz controlloparita	// se il bit è a 0 vado avanti
		inc bl				// se è a 1 incremento il contatore

	controlloparita :
		inc edx			//incremento il contatore dei bit fatti (8)
		inc cl			//incremento il contatore dei bit fatti (n)
		cmp cl, n		//guardo se sono arrivato fino a quello di parità
		jne prossimobit // in caso contrario vado avanti
		xor cl, cl		//resetto il counter di bit 
		test bl, 1
		jnz errore

	prossimobit :
		cmp edx, 8			//guardo se ho finito i bit della parola
		jae prossimaparola	// in caso vado alla prossima parola
		shr al, 1			//vado al prossimo bit
		jmp ciclocontrollo

	prossimaparola :
		xor edx, edx			//resetto il counter dei bit 
		inc edi					// vado all'elemento dopo di vet
		jmp cicloscorrimento	// se non ci sono errori finisco

	errore :
		mov errori, 1 //sennò imposto l'errore

	termina :
		dec n
